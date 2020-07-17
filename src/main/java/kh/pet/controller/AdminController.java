package kh.pet.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.mail.handlers.message_rfc822;

import kh.pet.dao.NaviDAO;
import kh.pet.dto.CommunityDTO;
import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.MessageDTO;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.ReportDTO;
import kh.pet.dto.Stop_memberDTO;
import kh.pet.dto.Visitor_countDTO;
import kh.pet.dto.WaitlistDTO;
import kh.pet.service.AdminService;
import kh.pet.service.MemberService;
import kh.pet.service.MessageService;
import kh.pet.service.Petservice;
import kh.pet.service.PetsitterboardService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private Petservice pet_service; 

	@Autowired
	private AdminService admin_service;

	@Autowired
	private HttpSession session;

	@Autowired
	private PetsitterboardService sitter_service;

	@Autowired
	private MessageService message_service;

	@Autowired
	private MemberService member_service;


	@RequestMapping("adminindex")
	public String go_admin_main(Model m,Integer cpage) {
		if(cpage == null) {
			cpage = 1;
		}
		//간편 회원 페이지
		List<MemberDTO> mdto = admin_service.member(cpage);
		String navi = admin_service.PagNavi(cpage,"main");
		m.addAttribute("memberlist",mdto);	
		m.addAttribute("navi",navi);

		//일일 방문자 차트
		List<Visitor_countDTO> be_visiter = admin_service.be_visitor();
		List<Visitor_countDTO> to_visiter = admin_service.to_visitor();
		m.addAttribute("to_visitor",to_visiter);
		m.addAttribute("be_visitor",be_visiter);


		return "admin/index";
	}

	//예약 관리

	@RequestMapping("reservation")
	public String go_admin_reservation() {
		return "admin/reservation_management";
	}

	@RequestMapping("re_select")
	public String re_board_select(String boardtype,Model m,Integer cpage) {
		if(cpage == null) {
			cpage = 1;
		}
		if(boardtype.contentEquals("mb")) {
			List<MemboardDto> list = admin_service.re_memboard(cpage);
			String navi = admin_service.PagNavi(cpage, boardtype);
			m.addAttribute("list", list);
			m.addAttribute("navi", navi);
		}else if(boardtype.contentEquals("ps")) {
			List<WaitlistDTO> list = admin_service.re_psboard(cpage);
			String navi = admin_service.PagNavi(cpage, boardtype);
			m.addAttribute("list", list);
			m.addAttribute("navi", navi);
		}
		session.setAttribute("boardtype", boardtype);
		return "admin/reservation_management";
	}

	
	
	@RequestMapping("accept_memboard")
	public void accept_memboard(MemboardDto dto, HttpServletResponse response) {
		int re = admin_service.accept_memboard(dto);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re);
		try {
			response.getWriter().append(jobj.toString());
		} catch (Exception e) {

		}
	}

	@RequestMapping("cancel_memboard")
	public void cancel_memboard(MemboardDto dto, HttpServletResponse response) {
		int re = admin_service.cancel_memboard(dto);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re);
		try {
			response.getWriter().append(jobj.toString());
		} catch (Exception e) {

		}
	}


	@RequestMapping("accept_petboard")
	public void accept_petboard(int wait_seq,HttpServletResponse response) {
		int re = admin_service.accept_petsitter(wait_seq);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re);
		try {
			response.getWriter().append(jobj.toString());
		} catch (Exception e) {

		}
	}

	@RequestMapping("cancel_patsitter")
	public void cancel_petboard(int wait_seq,HttpServletResponse response) {
		int re = admin_service.cancel_petsitter(wait_seq);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re);
		try {
			response.getWriter().append(jobj.toString());
		} catch (Exception e) {

		}
	}



	//펫 시터 신청서 관리
	@RequestMapping("petsiter")
	public String go_admin_petsiter(Model m, Integer cpage) {
		if(cpage == null) {
			cpage = 1;
		}
		List<PetsitterDTO> pet =  admin_service.petsitter(cpage);
		String navi = admin_service.PagNavi(cpage,"petsiter");
		m.addAttribute("navi",navi);
		m.addAttribute("petsitter", pet);
		return "admin/pet_siter_management";
	}

	@RequestMapping("petaccept")
	public void petaccept(String id,HttpServletResponse response) {
		int re = admin_service.petaccept(id);
		try {
			if(re>0) {
				MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
				MemberDTO mdto = member_service.loginInfo(dto.getMem_id());
				session.setAttribute("loginInfo", mdto);
				response.sendRedirect("/admin/petsiter");
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('데이터 전송에 실패했습니다.'); location.href='/admin/petsiter';</script>");
				out.flush();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("cencel")
	public void petcencel(String id,HttpServletResponse response) {
		int re = admin_service.petcencel(id);
		try {
			if(re>0) {
				response.sendRedirect("/admin/petsiter");
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('데이터 전송에 실패했습니다.'); location.href='/admin/petsiter';</script>");
				out.flush();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


	//회원 정보 관리

	@RequestMapping("member")
	public String go_admin_member(Integer cpage,Model m) {
		if(cpage == null) {
			cpage = 1;
		}
		List<MemberDTO> mdto = admin_service.member(cpage);
		String navi = admin_service.PagNavi(cpage,"member");
		m.addAttribute("navi",navi);
		m.addAttribute("memberlist",mdto);
		return "admin/member_management";
	}

	@RequestMapping("message")
	public void admin_message(MessageDTO dto,HttpServletResponse response) throws Exception{
		dto.setMsg_sender("관리자");
		int re = message_service.sendMessage(dto);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re );
		response.getWriter().append(jobj.toString());
	}

	@RequestMapping("mem_stop")
	public void member_stop(Stop_memberDTO dto,HttpServletResponse response) throws Exception {
		int re = admin_service.stop_mem(dto);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re );
		response.getWriter().append(jobj.toString());
	}
	//블랙 회원 관리

	@RequestMapping("black")
	public String go_admin_black(Integer cpage,Model m) {
		if(cpage == null) {
			cpage = 1;
		}
		//간편 회원 페이지
		List<MemberDTO> mdto = admin_service.black_member(cpage);
		System.out.println(mdto.get(0).getMem_id());
		String navi = admin_service.PagNavi(cpage,"black");
		m.addAttribute("memberlist",mdto);	
		m.addAttribute("navi",navi);

		return "admin/blacklist";
	}

	//게시판 관리

	@RequestMapping("board")
	public String go_admin_board(Integer cpage) {
		return "admin/board_management";
	}

	@RequestMapping("boardselect")
	public String boardselect(String boardtype, Integer cpage , Model m) throws Exception{
		if(cpage == null) {
			cpage = 1;
		}
		String navi = "";
		if(boardtype.contentEquals("mem_board")) {
			List<MemboardDto> boardlist = admin_service.m_board(boardtype, cpage);
			navi = admin_service.PagNavi(cpage, boardtype);
			m.addAttribute("list", boardlist);

		}else if(boardtype.contentEquals("petsitter_board")) {
			List<PetsitterboardDTO> boardlist = admin_service.p_board(boardtype, cpage);
			navi = admin_service.PagNavi(cpage, boardtype);
			m.addAttribute("list", boardlist);
		}
		else if(boardtype.contentEquals("free")) {
			List<CommunityDTO> boardlist = admin_service.c_board(boardtype, cpage);
			System.out.println(boardlist.get(0).getCu_seq());
			navi = admin_service.PagNavi(cpage, boardtype);

			m.addAttribute("list", boardlist);
		}

		m.addAttribute("navi",navi);
		session.setAttribute("boardtype", boardtype);
		return "admin/board_management";
	}



	@RequestMapping("boardblack")
	public void boardblack(String state, String seq,HttpServletResponse response) {
		String boardtype = (String)session.getAttribute("boardtype");
		admin_service.board_stop(seq, boardtype, state);
		try {
			response.sendRedirect("/admin/boardselect?boardtype="+boardtype);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("declaration")
	public String go_admin_declaration(Model m,Integer cpage) {
		if(cpage == null) {
			cpage = 1;
		}
		List<ReportDTO> list = admin_service.reportlist(cpage);
		m.addAttribute("reportlist", list);
		return "admin/Declaration_management";
	}

	@RequestMapping("cash")
	public String go_admin_cash() {
		return "admin/cash_management";
	}

	//관리자 패스워드 변경
	@RequestMapping("pass")
	public String go_admin_pass() {
		return "admin/admin_pasword";
	}

	@RequestMapping("admin_password")
	public String admin_password(String pass){
		String pw = member_service.getSHA512(pass);
		admin_service.admin_password(pw);
		return "admin/admin_pasword";
	}

	//관리자 메세지 관리
	@RequestMapping("mess")
	public String go_admin_mess(Integer cpage,Model m) {
		if(cpage == null) {
			cpage = 1;
		}
		List<MessageDTO> list = admin_service.message_list(cpage);
		String navi = admin_service.PagNavi(cpage, "mess");
		m.addAttribute("list", list);
		m.addAttribute("navi",navi);
		return "admin/message_management";
	}

	@RequestMapping("chat")
	public String go_admin_chat() {
		return "admin/index";
	}
}

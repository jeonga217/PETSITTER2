package kh.pet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dao.MypageDAO;
import kh.pet.dto.MemberDTO;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.service.Pet_regService;

@Controller
@RequestMapping("/mypage/")
public class Mypage_regController {
	
	@Autowired
	private Pet_regService regservice;

	@Autowired
	private MypageDAO mdao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("mypet_reg")
	public void mypet_reg(Mypet_regDTO dto,MultipartFile img, HttpServletResponse response) throws Exception{	
		MemberDTO dtos = (MemberDTO)session.getAttribute("loginInfo");
		regservice.reg(dtos.getMem_id(), dto, img);
		response.sendRedirect("list");
	}
	
	@RequestMapping("exchange")
	public String exchange() {	
		return "/mypage/exchange";
	}
	
	@RequestMapping("contentview")
	public String contentview(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("�떆���뒪 媛� : "+seq);
		Mypet_regDTO dto = mdao.petlist(seq);
		request.setAttribute("dto", dto);
		return "/mypage/mypage-contentview";
	}
	
	
	
	@RequestMapping("petdel")
	public void petdel(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int seq = Integer.parseInt(request.getParameter("seq"));
		mdao.petdel(seq);
		response.sendRedirect("list");
	}
}

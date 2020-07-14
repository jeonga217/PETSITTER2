package kh.pet.controller;

import java.util.List;

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
import kh.pet.dto.PointDTO;
import kh.pet.dto.RegLookupDTO;
import kh.pet.service.Mypage_dateService;
import kh.pet.service.Mypage_petmodfiyService;
import kh.pet.service.Pet_listService;
import kh.pet.service.PointService;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

	int sum = 0;
	
	@Autowired
	private Mypage_petmodfiyService petmodfiy;

	@Autowired
	private MypageDAO mdao;

	@Autowired
	HttpSession session;

	@Autowired
	private Pet_listService plistservice;

	@Autowired
	private PointService pointservice;

	@Autowired
	private Mypage_dateService dateservice;
	
	
	@RequestMapping("mypage")
	public String main() {
		return "mypage/mypage-main";
	}

	@RequestMapping("mypageuse")
	public String mypageuse(HttpServletRequest request) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		List<RegLookupDTO> list = mdao.reglookup(dto.getMem_id());
		request.setAttribute("list", list);
		return "mypage/Mypage-Use";
	}

	@RequestMapping("mypet")
	public String mypet() {
		return "mypage/mypage-reservation";
	}

	@RequestMapping("community")
	public String community(HttpServletRequest request) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		try {
			int cpage = 1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			} catch (Exception e) {
			}
			System.out.println("현재페이지:" + cpage);
			List<Object> bdto = plistservice.selectByPageNo(cpage, dto.getMem_id(), "community");
			String navi = plistservice.getPageNavi(cpage, "community");
			request.setAttribute("navi", navi);
			request.setAttribute("bdto", bdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return "mypage/mypage-community";
	}

	@RequestMapping("Introduction")
	public String Introduction(HttpServletRequest request) {
		return "mypage/mypage-Introduction";
	}

	@RequestMapping("pay")
	public String pay(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("mem_point"));
		System.out.println(num);
		request.setAttribute("num", num);
		return "mypage/payment";
	}

	@RequestMapping("listpoint")
	public String listpoint(HttpServletRequest request) {
		try {
			int cpage = 1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			} catch (Exception e) {
			}
			MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
			System.out.println("현재페이지:" + cpage);
			List<Object> bdto = plistservice.selectByPageNo(cpage, dto.getMem_id(), "listpoint");
			String navi = plistservice.getPageNavi(cpage, "listpoint");
			List<PointDTO> list = mdao.pointall(dto.getMem_id());
			List<int[]> pm = dateservice.datesetting(list);
			String mem_type = mdao.typecheck(dto.getMem_id());
			int sum = mdao.pointcount(dto.getMem_id());
			request.setAttribute("navi", navi);
			request.setAttribute("bdto", bdto);
			request.setAttribute("mem_type", mem_type);
			request.setAttribute("sum", sum);
			request.setAttribute("list", list);
			request.setAttribute("pm", pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mypage/mypage-point";
	}

	int pointnum = 0;

	@RequestMapping("Conversion")
	public String Conversion(HttpServletRequest request) {
		String mem_point = request.getParameter("mem_point");
		pointnum = pointservice.Pointexchange(mem_point);
		if (pointnum != 0) {
			request.setAttribute("pointnum", pointnum);
			return "mypage/payment";
		}
		return "mypage/Introduction";
	}

	@RequestMapping("pointadd")
	public void pointadd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		String mem_type = mdao.typecheck(dto.getMem_id());
		mdao.pointinsert(dto.getMem_id(), pointnum, "입금", mem_type);
		response.sendRedirect("listpoint");
	}

	@RequestMapping("list")
	public String reservation(HttpServletRequest request) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		try {
			int cpage = 1;
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			} catch (Exception e) {
			}
			System.out.println("현재페이지:" + cpage);
			List<Object> bdto = plistservice.selectByPageNo(cpage, dto.getMem_id(), "list");
			String navi = plistservice.getPageNavi(cpage, "list");
			request.setAttribute("navi", navi);
			request.setAttribute("bdto", bdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mypage/mypage-list";
	}

	@RequestMapping("registration")
	public String registration() {
		return "mypage/mypet-registration";
	}
	
	@RequestMapping("modfiy")
	public String modfiy(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		Mypet_regDTO modresult = mdao.modfiylist(dto.getMem_id(), seq);
		request.setAttribute("modresult", modresult);
		return "mypage/mypage-modfiy";
	}
	@RequestMapping("resultmodfiy")
	public void resultmodfiy(Mypet_regDTO dto, MultipartFile img, HttpServletResponse response)throws Exception {
		MemberDTO dtos = (MemberDTO)session.getAttribute("loginInfo");
		dto.setMaster_id(dtos.getMem_id());
		petmodfiy.modfiy(dto, img);
		response.sendRedirect("list");
	}

}

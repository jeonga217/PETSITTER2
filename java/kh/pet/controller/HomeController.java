package kh.pet.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.ReviewDTO;
import kh.pet.service.ReviewService;
import kh.pet.staticInfo.Log_Count;

@Controller
public class HomeController {
	
	@Autowired
	private ReviewService service; 
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String home(Model m) throws Exception {
		List<ReviewDTO> reviewD = service.review();
		session.getAttribute("loginInfo");
		m.addAttribute("reviewD", reviewD);
		return "outmain";
	}
	
	@RequestMapping("login2")
	public String login(String id) {
		Log_Count.log_count++;
		System.out.println(Log_Count.log_count);
		return "home2";
	}
	
	@RequestMapping("/message")
	public String message() {
		return "home2";
	}
	

	
	@RequestMapping("community")
	public String community() {
		return "/";
	}
	
	/*
	 * @RequestMapping("/point/charge") public String charge() { return
	 * "/petsitter_board/point/charge"; }
	 * 
	 * @RequestMapping("/point/payment") public String payment(int mem_point,Model
	 * model) { model.addAttribute("point",mem_point); return
	 * "/petsitter_board/point/payment"; }
	 */
	
	@RequestMapping("/signup")
	public String signup() {
		return "member/signup";
	}
	
	
	
	//예아 ㅇ0ㅇ
	
	
}

package kh.pet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;

import kh.pet.dto.MemberDTO;
import kh.pet.service.KakaoAPIService;
import kh.pet.service.MemberService;
import kh.pet.service.NaverLoginService;
import kh.pet.staticInfo.Log_Count;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService mservice;

	@Autowired
	private HttpSession session;	
	@Autowired
	private NaverLoginService naser;
	

	JSONObject jobj = new JSONObject();


	@ResponseBody
	@RequestMapping("isExistId")
	public String isExistId(String ps_id)throws Exception{
		String result =  mservice.isExistId(ps_id);
		if(result.contentEquals("true")) {
			return "true";
		}
		return "false";
	}


	@RequestMapping("/signup")
	public String signup() throws Exception { //가입 페이지로 이동

		return "/member/signup";
	}

	@ResponseBody 
	@RequestMapping("/idDuplCheck")
	public int idDuplCheck(String id) throws Exception {
		int result = mservice.idDuplCheck(id);
		return result;
	}

	@ResponseBody 
	@RequestMapping("/emailDuplCheck")
	public int emilDuplCheck(String email) throws Exception {
		int result = mservice.emailCheck(email);
		return result;
	}



	@RequestMapping(value = "/signupProc", method = RequestMethod.POST)
	public void signupProc(MemberDTO mdto,HttpServletResponse rep) throws Exception{


		if(mdto == null) {
			jobj.put("result", 0 );
			rep.getWriter().append(jobj.toString());
		}

		mservice.signup(mdto);

		jobj.put("result", 1);
		rep.getWriter().append(jobj.toString());

	}


	@RequestMapping(value = "/sns_signupProc", method = RequestMethod.POST)
	public void sns_signupProc(MemberDTO mdto,HttpServletResponse rep) throws Exception {

		if(mdto == null) {
			jobj.put("result", 0 );
			rep.getWriter().append(jobj.toString());

		}

		mservice.sns_signup(mdto);

		jobj.put("result", 1);
		rep.getWriter().append(jobj.toString());

	}


	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public void emailConfirm(String authKey, String userid, HttpServletResponse response) throws IOException {

		int verify = mservice.verify(userid);

		if(verify > 0) {		

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 인증하셨습니다.'); location.href='/';</script>");
			out.flush();
		}

		if(authKey == "" || userid == "" || (authKey == "" && userid == "")) {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증키가 잘못되었습니다. 다시 인증해 주세요'); location.href='/';</script>");
			out.flush();
		}

		int result= mservice.emailConfirm(authKey, userid);		

		if(result <= 0) {	
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근 입니다. 다시 인증해 주세요'); location.href='/';</script>");
			out.flush();						
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('인증 완료되었습니다. 로그인 후 이용 가능합니다.'); location.href='/';</script>");
		out.flush();	

	}



	//로그인
	@RequestMapping(value="/loginProc", method=RequestMethod.POST)
	public void loginProc( String mem_id, String mem_pw, Model model, HttpServletResponse rep) throws Exception {
		JSONObject jobj = new JSONObject();

		String pw1 = mservice.getSHA512(mem_pw);
		
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", mem_id);
		map.put("pw", pw1);


		boolean result = mservice.login(map);

		if(result) {

			int econfirm = mservice.verify(mem_id); //이메일 인증여부

			if(econfirm <= 0) {									

				jobj.put("result", econfirm );
				rep.getWriter().append(jobj.toString());

			}else {		//정상 로그인

				MemberDTO mdto = mservice.loginInfo(mem_id);
				Log_Count.log_count++;
				session.setAttribute("loginInfo", mdto);
				jobj.put("result", 2);
				rep.getWriter().append(jobj.toString());				

			}

		}else { //로그인 실패 

			jobj.put("result", 1);
			rep.getWriter().append(jobj.toString());
		}

	}

	//아이디 찾기 페이지 연결
	@RequestMapping("/findInfo")
	public String findid() {
		return "/member/findinfo";		
	}

	//아이디 찾기 ajax
	@ResponseBody
	@RequestMapping(value = "/findIdProc", method = RequestMethod.POST)
	public String findID(String email) {

		String id= mservice.findID(email);
		
		JsonObject jobj = new JsonObject();
		jobj.addProperty("id", id);

		String result = jobj.toString();
	

		return result;

	}

	@RequestMapping(value = "/findPwProc", method = RequestMethod.POST)
	@ResponseBody
	public int findPw(String id, String email) throws Exception {

		int result = 0;

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);

		int chkpw = mservice.findPw(map);

		if(chkpw > 0) {			
			result = mservice.replacepw(id, email);
			return result;
		}		
		return result;	
	}


	@RequestMapping("/kakao") //카카오 로그인
	public String kakaologin(String code, Model model) throws Exception {

		KakaoAPIService ka = new KakaoAPIService();
		String access_Token = ka.getAccessToken(code);

		HashMap<String, String> userInfo = ka.getUserInfo(access_Token);

		String id = userInfo.get("id");
		String email = userInfo.get("email");

		Map<String, String> map = new HashMap<String, String>(); //ID, 이메일 저장해서 회원정보 확인과 정보보내기 위함.
		map.put("id", id);
		map.put("email", email);

		int kakao_id = mservice.findSNS(map); //id있는지 확인.	

		if(kakao_id < 1) {

			model.addAttribute("joinInfo", map);
			model.addAttribute("join_type", 2);
			return "/member/signup_sns";
		}

		MemberDTO mdto = mservice.loginInfo(id);
		Log_Count.log_count++;
		session.setAttribute("loginInfo", mdto);
		session.setAttribute("access_Token", access_Token);

		return "redirect:/"; //메인으로 가야함.


	}

	@RequestMapping("/naver")
	public String naver(HttpServletResponse rep) throws IOException, URISyntaxException {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naser.getAuthorizationUrl(session);

		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		Log_Count.log_count++;

		return "redirect:"+naverAuthUrl;

	}



	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		
		OAuth2AccessToken oauthToken;
		oauthToken = naser.getAccessToken(session, code, state);

		//로그인 사용자 정보를 읽어온다.
		HashMap<String, String> userInfo  = naser.getUserProfile(oauthToken);

		String id = userInfo.get("id");
		String email = userInfo.get("email");

		Map<String, String> map = new HashMap<String, String>(); //ID, 이메일 저장해서 회원정보 확인과 정보보내기 위함.
		map.put("id", id);
		map.put("email", email);

		int naver_id = mservice.findSNS(map); //id있는지 확인.	
		if(naver_id < 1) {

			model.addAttribute("joinInfo", map);
			model.addAttribute("join_type", 3);

			return "/member/signup_sns";

		}
		return "/";
	}


	@RequestMapping("/logout") //로그아웃
	public String logout() {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int type = dto.getMem_join_type();
		
		
		
		if(type == 1) {
			session.invalidate();
			return "redirect:/";
		}else if(type == 2) {
		
			KakaoAPIService ka = new KakaoAPIService();
			ka.kakaoLogout((String)session.getAttribute("access_Token"));
			
			
			session.invalidate();			
			return "redirect:/";
		}
		
		session.invalidate();
		return "redirect:/";
		 
	}


	@RequestMapping(value ="/withdraw",  method = RequestMethod.GET) //회원탈퇴
	public String withdraw() throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String id = dto.getMem_id();
		int type = dto.getMem_join_type();
		
		
		if(type == 1) {
			mservice.withdraw(id);
			session.invalidate();
			return "redirect:/";
			
		}else if(type == 2) {
			
			KakaoAPIService ka = new KakaoAPIService();
			
			mservice.withdraw(id);
			 ka.kakaoWithdraw((String)session.getAttribute("access_Token"));
			 session.invalidate();
			return "redirect:/";
		}
		
		 session.invalidate();
		return "redirect:/";
		

	}	
	
		
}



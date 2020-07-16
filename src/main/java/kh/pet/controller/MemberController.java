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
import org.springframework.web.bind.annotation.ExceptionHandler;
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

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService mservice;

	@Autowired
	private HttpSession session;	

	private NaverLoginService naser;
	private String apiResult = null;

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
		
		System.out.println("컨트롤러까지 오셨는지?");

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
		
		System.out.println("여까지 못 오니?1");
		
		
		if(mdto == null) {
			jobj.put("result", 0 );
			rep.getWriter().append(jobj.toString());
				
		}
		
		System.out.println(mdto.getMem_id());
		
		System.out.println("여까지 못 오니?2");
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
			
//			model.addAttribute("msg" , "이미 인증하셨습니다.");
//			return "/member/emailconfirm"; 
		}

		if(authKey == "" || userid == "" || (authKey == "" && userid == "")) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증키가 잘못되었습니다. 다시 인증해 주세요'); location.href='/';</script>");
			out.flush();

//			model.addAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");			
//			return "/member/emailconfirm";
		}

		int result= mservice.emailConfirm(authKey, userid);		

		if(result <= 0) {	
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 접근 입니다. 다시 인증해 주세요'); location.href='/';</script>");
			out.flush();						
			
//			model.addAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
//			return "/member/emailconfirm";
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
		System.out.println("3: "+result);

		if(result) {

			int econfirm = mservice.verify(mem_id); //이메일 인증여부

			if(econfirm <= 0) {									

				jobj.put("result", econfirm );
				rep.getWriter().append(jobj.toString());

			}else {		

				MemberDTO mdto = mservice.loginInfo(mem_id);
				session.setAttribute("loginInfo", mdto);
				jobj.put("result", 2);
				rep.getWriter().append(jobj.toString());				

			}

		}else {

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
		//System.out.println("id는? "+id);

		JsonObject jobj = new JsonObject();
		jobj.addProperty("id", id);

		String result = jobj.toString();
		// System.out.println(result);

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
		session.setAttribute("loginInfo", mdto);
		session.setAttribute("access_Token", access_Token);

		return "redirect:/"; //메인으로 가야함.


	}

	@RequestMapping("/naver")
	public String naver(HttpServletResponse rep) throws IOException, URISyntaxException {
		
		System.out.println("1");

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naser.getAuthorizationUrl(session);
		System.out.println("2");
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		//네이버 
		//   model.addAttribute("url", naverAuthUrl);	

		return "redirect:"+naverAuthUrl;

	}



	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		System.out.println("여기는 callback");
		System.out.println("code: "+code);
		System.out.println("state: "+state);
		System.out.println("session: "+session);

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

	@RequestMapping("/mypage")
	public String mypage() {

		return "/member/mypage";
	}

	
	@RequestMapping("/logout") //로그아웃
	public String logout() {
		
		session.invalidate();
		return "redirect:/";
		
	}
	
	
	@RequestMapping("/withdraw") //회원탈퇴
	public String withdraw(String id) {
		
		mservice.withdraw(id);
		
		return "redirect:/";
	
	}
}

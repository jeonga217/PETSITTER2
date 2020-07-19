package kh.pet.service;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class NaverLoginService {


	private final static String CLIENT_ID = "Z6wGd_RWztXAjZ2fujWE";
	private final static String CLIENT_SECRET = "ChaaViZMdL";
	private final static String REDIRECT_URI = "http://localhost/member/naverlogin";
	private final static String SESSION_STATE = "oauth_state";
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	/* 네이버 아이디로 인증  URL 생성  Method */
	public String getAuthorizationUrl(HttpSession session) {
		
		
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		/* 생성한 난수 값을 session에 저장 */
		setSession(session,state);        

		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()                                                   
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
				.build(NaverLoginApi.instance());

		return oauthService.getAuthorizationUrl();
	}

	/* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)){

			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());

			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	/* http session에 데이터 저장 */
	private void setSession(HttpSession session,String state){
		
		session.setAttribute(SESSION_STATE, state);     
	}

	/* http session에서 데이터 가져오기 */ 
	private String getSession(HttpSession session){
		
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	
	
	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public HashMap<String, String> getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
		 HashMap<String, String> userInfo = new HashMap<>();
		 
		OAuth20Service oauthService =new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginApi.instance());

		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		String nlogininfo = response.getBody();
	
		System.out.println(nlogininfo);
		
		JsonElement jel = JsonParser.parseString(nlogininfo);
		JsonObject naver_account = jel.getAsJsonObject().get("response").getAsJsonObject();
		String id = naver_account.get("id").getAsString();
		String email = naver_account.get("email").getAsString();
		
				
		userInfo.put("id", id);
		userInfo.put("email", email);
		
		
		return userInfo;
	}


}

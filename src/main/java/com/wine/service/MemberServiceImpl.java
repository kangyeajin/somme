package com.wine.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wine.mapper.MemberMapper;
import com.wine.model.MemberVO;
import com.wine.model.prodCriteria;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public void insertMember(MemberVO memberVO) {

		mapper.insertMember(memberVO);

	}

	@Override
	public MemberVO getMember(String id) {
		return mapper.getMember(id);
	}

	@Override
	public MemberVO signIn(String id, String pwd) {
		return mapper.signIn(id, pwd);
	}

	@Override
	public String PhoneNumCheck(String phone) {
		String api_key = "NCSO1Q4DSDL0RLX3";
		String api_secret = "0MVLL2JOX24OHVJHIKSHCQJZTSZDSLC7";
//		Message coolsms = new Message(api_key, api_secret);
		
		 Random rand = new Random(); 
			String numStr = "";
			for(int i=0; i<4; i++) {
				String ran = Integer.toString(rand.nextInt(10)); 
				numStr += ran;
			}

			 HashMap<String, String> params = new HashMap<String, String>();
			    params.put("to", phone);
			    params.put("from", "01034366013"); 
			    params.put("type", "SMS");
			    params.put("text", "[wine Shop] �씤利앸쾲�샇 ["+numStr+"] 瑜� �엯�젰�븯�꽭�슂.");
			    params.put("app_version", "test app 1.2"); // application name and version

//			    try {
//			      JSONObject obj = (JSONObject) coolsms.send(params);
//			      System.out.println(obj.toString());
//			    } catch (CoolsmsException e) {
//			      System.out.println(e.getMessage());
//			      System.out.println(e.getCode());
//			    }
			
		return numStr;
	}

	@Override
	public MemberVO selectIdByName(String name, String phone) {
		
		return mapper.selectIdByName(name, phone);
	}

	@Override
	public MemberVO selectPWById(String id, String name, String email) {
		return mapper.selectPWById(id, name, email);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		 mapper.updateMember(memberVO);
	}

	@Override
	public void deleteMember(String id) {
		mapper.deleteMember(id);
		
	}
	@Override
	public void deleteKakaoMember(String id) {
		mapper.deleteKakaoMember(id);
		
	}


	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=30f63685c78dac2b5b5affd97dbf0daf"); //蹂몄씤�씠 諛쒓툒諛쏆� key
			sb.append("&redirect_uri=http://localhost:8090/member/kakaoLogin"); // 蹂몄씤�씠 �꽕�젙�븳 二쇱냼
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
		
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String id = element.getAsJsonObject().get("id").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();

			userInfo.put("id", id);
			userInfo.put("nickname", nickname);
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public void insertkakao(MemberVO memberVO) {
		mapper.inserkakao(memberVO);
		
	}
	@Override
    public void getLogout(String access_Token) {
        String reqURL ="https://kapi.kakao.com/v1/user/unlink";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            System.out.println("로그아웃하려는 토큰 값은 "+access_Token);
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            if(responseCode ==400)
                throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
            
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String br_line = "";
            String result = "";
            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }
            System.out.println("결과");
            System.out.println(result);
        }catch(IOException e) {
            
        }
    }

	@Override
	public List<MemberVO> listAllMember() {
		List<MemberVO> list = mapper.listAllMember();
		return list;
	}
	
	@Override
	public boolean multiMemberDelete(String id) {
		return mapper.multiMemberDelete(id) == 1;
	}
	@Override
	public int getTotalCount(prodCriteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<MemberVO> adminMemberPage(prodCriteria cri) {
		log.info("criteria: " + cri);
		return mapper.adminMemberPage(cri);
	}

	@Override
	public void insertAuth(MemberVO memberVO) {
		mapper.insertAuth(memberVO);
		
	}

	@Override
	public void updatePassword(String id, String npwd) {
		 mapper.updatePassword(id, npwd);
	}


}

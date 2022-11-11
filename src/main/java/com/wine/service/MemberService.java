package com.wine.service;

import java.util.HashMap;
import java.util.List;

import com.wine.model.MemberVO;
import com.wine.model.prodCriteria;

public interface MemberService {
	/*회원가입*/
	public void insertMember(MemberVO memberVO);
	public void insertAuth(MemberVO memberVO);
	/*카카오 회원가입*/
	public void insertkakao(MemberVO memberVO);
	/*로그인*/
	public MemberVO getMember(String id);
	/*로그인 유저 체크*/
	public MemberVO  signIn(String id, String pwd);
	/*인증문자 발송*/
	public String PhoneNumCheck(String phone);
	/*아이디 찾기*/
	public MemberVO selectIdByName(String name, String phone);
	/*비밀번호 찾기*/
	public MemberVO selectPWById(String id,String name, String email);
	/*정보 수정*/
	public void updateMember(MemberVO memberVO);
	/*회원 탈퇴*/
	public void deleteMember(String id);
	
	public String getAccessToken (String authorize_code);
	
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	public void getLogout(String access_Token);
	/*카카오 유저 삭제*/
	public void deleteKakaoMember(String id);
	
	/*관리자*/
	
	public List<MemberVO> listAllMember();
	
	public boolean multiMemberDelete(String id);
	
	// 전체 레코드 갯수
	public int getTotalCount(prodCriteria cri);

	public List<MemberVO> adminMemberPage(prodCriteria cri);
	/*비번 바꾸기*/
	public void updatePassword(String id, String npwd);
}

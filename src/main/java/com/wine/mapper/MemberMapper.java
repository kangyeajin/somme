package com.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wine.model.MemberVO;
import com.wine.model.prodCriteria;

public interface MemberMapper {
	/*회원가입*/
	public void insertMember(MemberVO memberVO);
	/*auth 생성*/
	public void insertAuth(MemberVO memberVO);
	/*카카오 회원가입*/
	public void inserkakao(MemberVO memberVO);
	
	public MemberVO getMember(String id);
	/*로그인 */
	public MemberVO  signIn(@Param("id")String id, @Param("pwd")String pwd);
	/*아이디 찾기*/
	public MemberVO selectIdByName(@Param("name")String name, @Param("phone")String phone);
	/*비밀번호 찾기*/
	public MemberVO selectPWById(@Param("id")String id,@Param("name")String name, @Param("email")String email);
	/*정보 수정*/
	public void updateMember(MemberVO memberVO);
	/*회원 탈퇴*/
	public void deleteMember(String id);
	/*카카오 회원 삭제*/
	public void deleteKakaoMember(String id);
	
	public List<MemberVO> listAllMember();
	
	public int multiMemberDelete(String id);
	// 전체 레코드 갯수
	public int getTotalCount(prodCriteria cri);

	public List<MemberVO> adminMemberPage(prodCriteria cri);
	
	public MemberVO read(String userid);
	//비번변경
	public void updatePassword(@Param("id")String id, @Param("npwd")String npwd);
}

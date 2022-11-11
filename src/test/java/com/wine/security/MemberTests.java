package com.wine.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml",
})
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	//계정 생성
	@Test
	public void testInsertMember() {
		String sql = "insert into member(id, pwd, name) values (?,?,?)";
		for(int i=0; i<6; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				//비밀번호 > encode해서 db에 저장
				pstmt.setString(2, pwencoder.encode("1234"));
				
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "일반사용자"+i);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					}catch(Exception e) {
					}
				}
				if(con != null) {
					try {
						con.close();
					}catch(Exception e) {
					}
				}
			}
		}//end for
	}
	
	//권한 부여
	@Test
	public void testInsertAuth() {
		String sql = "insert into member_auth (id, auth) values (?,?)";
		
		for(int i=0; i<6; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_MEMBER");
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					}catch(Exception e) {
					}
				}
				if(con != null) {
					try {
						con.close();
					}catch(Exception e) {
					}
				}
			}
		}//end for
	}


//계정 생성
@Test
public void testInsertAdmin() {
	String sql = "insert into member(id, pwd, name) values (?,?,?)";
	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			//비밀번호 > encode해서 db에 저장
			pstmt.setString(2, pwencoder.encode("1234"));
			
				pstmt.setString(1, "admin");
				pstmt.setString(3, "관리자");
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
				}
			}
		}
}

//권한 부여
@Test
public void testInsertAuthAdmin() {
	String sql = "insert into member_auth (id, auth) values (?,?)";
	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			

				pstmt.setString(1, "admin");
				pstmt.setString(2, "ROLE_ADMIN");
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
				}
			}
		}
}

}

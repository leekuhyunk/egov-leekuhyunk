  
package edu.human.com.authorrole;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.logging.impl.SimpleLog;
import org.apache.log4j.Logger;

import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.security.userdetails.EgovUserDetails;
import egovframework.rte.fdl.security.userdetails.jdbc.EgovUsersByUsernameMapping;

/**
 * EgovSessionMapping클래스는 아래 기능을 수행한다. 
 * context-security.xml의 쿼리 결과를 변수로 담을 공간을 여기 생성 후 세션에 사용할 값 저장.
 * @author 이규혁
 *
 */
public class EgovSessionMapping extends EgovUsersByUsernameMapping {

	//로거 사용법: 기존에는 System.out.println("디버그"); logger변수를 사용합니다.
	//로거를 사용하는 이유는 배포할때 System.out.~ 이부분을 지우는 것도 일입니다. 이런일을 방지하기 위해서.
	//보통 new 키워드로 객체를 생성하는데, 이것은 여러번 생성할때, 1번만 생성하는 클래스(싱클톤)는 get방식으로 객체를 만듭니다.  
	private Logger logger = Logger.getLogger(SimpleLog.class);
	
	public EgovSessionMapping(DataSource ds, String usersByUsernameQuery) {
		super(ds, usersByUsernameQuery);
		// 생성자 매서드로 부모클래스의 쿼리 실행.
	}

	@Override
	protected EgovUserDetails mapRow(ResultSet rs, int rownum) throws SQLException {
		// EgovUserDetails 맵형 데이터를 반환받는 코드를 개발자가 작성
		logger.debug("디버그 메세지");//log4j2설정에서 DEBUG라고 값을 줘야지만 출력이 됨.
		String strUserId = rs.getString("user_id");
		String strPassword = rs.getString("password");
		boolean strEnabled = rs.getBoolean("enabled");
		String strUserNm = rs.getString("user_nm");
		String strUserSe = rs.getString("user_se");
		String strUserEmail = rs.getString("user_email");
		String strOrgnztId = rs.getString("orgnzt_id");
		String strUniqId = rs.getString("esntl_id");
		String strOrgnztNm = rs.getString("orgnzt_nm");
		//세션들어갈 loginVO 변수생성(아래)
		LoginVO loginVO = new LoginVO();
		loginVO.setId(strUserId);
		loginVO.setPassword(strPassword);
		loginVO.setName(strUserNm);
		loginVO.setUserSe(strUserSe);
		loginVO.setEmail(strUserEmail);
		loginVO.setOrgnztId(strOrgnztId);
		loginVO.setUniqId(strUniqId);
		loginVO.setOrgnztNm(strOrgnztNm);
		
		EgovUserDetails egovUserDetails = new EgovUserDetails(strUserId, strPassword, strEnabled, loginVO);
		
		return egovUserDetails;
	}

}
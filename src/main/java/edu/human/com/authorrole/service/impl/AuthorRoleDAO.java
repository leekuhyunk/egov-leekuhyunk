package edu.human.com.authorrole.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.human.com.authorrole.service.AuthorRoleVO;
import edu.human.com.common.EgovComAbstractMapper;
import edu.human.com.util.PageVO;

@Repository
public class AuthorRoleDAO extends EgovComAbstractMapper {
	
	public AuthorRoleVO viewAuthorRole(int AUTHORROLE_ID) throws Exception {
		return selectOne("authorroleMapper.viewAuthorRole", AUTHORROLE_ID);
	}
	public int countAuthorRole(PageVO pageVO) throws Exception {
		return selectOne("authorroleMapper.countAuthorRole", pageVO);
	}
	
	public List<AuthorRoleVO> selectAuthorRole(PageVO pageVO) throws Exception {
		//pageVO는 초기값이 필요합니다. 초기값은 Controller 클래스에 입력하게 됩니다.
		List<AuthorRoleVO> authorRoleList = selectList("authorroleMapper.selectAuthorRole",pageVO);
		return authorRoleList;
	}
	public void updateAuthorRole(AuthorRoleVO authorRoleVO) {
		
		update("authorroleMapper.updateAuthorRole", authorRoleVO);
	}
}
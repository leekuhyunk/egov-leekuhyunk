package edu.human.com.authorrole.service;

import java.util.List;

import edu.human.com.util.PageVO;

public interface AuthorRoleService {
	
	public List<AuthorRoleVO> selectAuthorRole(PageVO pageVO) throws Exception;
	public AuthorRoleVO viewAuthorRole(int AUTHORROLE_ID) throws Exception;
	public void updateAuthorRole(AuthorRoleVO authorRoleVO) throws Exception;
}
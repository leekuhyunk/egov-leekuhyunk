package edu.human.com.authorrole.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.human.com.authorrole.service.AuthorRoleService;
import edu.human.com.authorrole.service.AuthorRoleVO;
import edu.human.com.util.PageVO;

@Service
public class AuthorRoleServiceImpl implements AuthorRoleService {
	@Inject
	private AuthorRoleDAO authorRoleDAO;
	
	@Override
	public List<AuthorRoleVO> selectAuthorRole(PageVO pageVO) throws Exception {
		
		return authorRoleDAO.selectAuthorRole(pageVO);
	}

	@Override
	public AuthorRoleVO viewAuthorRole(int AUTHORROLE_ID) throws Exception {
		
		return authorRoleDAO.viewAuthorRole(AUTHORROLE_ID);
	}

	@Override
	public void updateAuthorRole(AuthorRoleVO authorRoleVO) throws Exception {
		
		authorRoleDAO.updateAuthorRole(authorRoleVO);
	}

	@Override
	public void insertAuthorRole(AuthorRoleVO authorRoleVO) throws Exception {
		authorRoleDAO.insertAuthorRole(authorRoleVO);
	}

	@Override
	public void deleteAuthorRole(int AUTHORROLE_ID) throws Exception {
		authorRoleDAO.deleteAuthorRole(AUTHORROLE_ID);
	}

}
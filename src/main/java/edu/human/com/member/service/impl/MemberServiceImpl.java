package edu.human.com.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;
import edu.human.com.util.PageVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public List<EmployerInfoVO> selectMember(PageVO pageVO) throws Exception {
		// DAO클래스에서 메서드호출
		return memberDAO.selectMember(pageVO);
	}

	@Override
	public EmployerInfoVO viewMember(String emplyr_id) throws Exception {
		// DAO클래스에서 매서드호출
		return memberDAO.viewMember(emplyr_id);
	}

	@Override
	public int deleteMember(String emplyr_id) throws Exception {
		// DAO클래스에서 메서드호출
		return memberDAO.deleteMember(emplyr_id);
	}

	@Override
	public void insertMember(EmployerInfoVO employerInfoVO) throws Exception {
		// DAO클래스에서 메서드호출
		memberDAO.insertMember(employerInfoVO);
	}

	@Override
	public void updateMember(EmployerInfoVO employerInfoVO) throws Exception {
		// DAO클래스에서 메서드호출
		memberDAO.updateMember(employerInfoVO);
	}

	@Override
	public Map<Object, Object> selectCodeMap(String code_id) throws Exception {
		// DAO클래스에서 메서드호출
		return memberDAO.selectCodeMap(code_id);
	}

	@Override
	public Map<Object, Object> selectGroupMap() throws Exception {
		// DAO클래스에서 메서드호출
		return memberDAO.selectGroupMap();
	}

}
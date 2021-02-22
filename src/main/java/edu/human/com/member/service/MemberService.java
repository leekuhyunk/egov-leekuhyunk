package edu.human.com.member.service;

import java.util.List;
import java.util.Map;

import edu.human.com.util.PageVO;

public interface MemberService {
	public List<EmployerInfoVO> selectMember(PageVO pageVO) throws Exception;
	public EmployerInfoVO viewMember(String emplyr_id) throws Exception;
	public int deleteMember(String emplyr_id) throws Exception;
	public void insertMember(EmployerInfoVO employerInfoVO) throws Exception;
	public void updateMember(EmployerInfoVO employerInfoVO) throws Exception;
	//공통코드 맵타입반환받기(아래)
	public Map<Object,Object> selectCodeMap(String code_id) throws Exception;
	//권한그룹 멥타입반환받기(아래)
	public Map<Object,Object> selectGroupMap() throws Exception;
}
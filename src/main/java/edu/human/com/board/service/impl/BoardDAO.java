package edu.human.com.board.service.impl;

import org.springframework.stereotype.Repository;

import edu.human.com.common.EgovComAbstractMapper;

@Repository
public class BoardDAO extends EgovComAbstractMapper {
	public int delete_board(Integer nttId) throws Exception {
		//egov매퍼추상클래스사용:sqlSession템플릿
		return delete("boardMapper.delete_board",nttId);
	}
	
	public Integer delete_attach(String atchFileId) {
		// 마이바티스 매퍼쿼리 호출(아래)
		return delete("boardMapper.delete_attach",atchFileId);
	}
	
	public int delete_attach_detail(String atchFileId) {
		// 마이바티스 매퍼쿼리 호출(첨부파일상세테이블)
		return delete("boardMapper.delete_attach_detail",atchFileId);
	}
}

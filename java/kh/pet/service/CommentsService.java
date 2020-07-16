package kh.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.CommentsDAO;
import kh.pet.dto.CommentsDTO;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsDAO cm_dao;
	
	//댓글 작성
	public int insert(CommentsDTO cm_dto, int cm_parent_seq, String cm_writer)throws Exception{
		
		cm_dto.setCm_parent_seq(cm_parent_seq);
		cm_dto.setCm_writer(cm_writer);
		return cm_dao.insert(cm_dto);
	}
	
	//댓글 보기
	public List<CommentsDTO> commentsAll(int cm_parent_seq)throws Exception{
		
		return cm_dao.commentsAll(cm_parent_seq);
	}

	//댓글 수정
	public int update(CommentsDTO cm_dto) throws Exception {
		return cm_dao.update(cm_dto);
	}
	
	//댓글 삭제
	public int delete(int cm_seq) throws Exception{
		return cm_dao.delete(cm_seq);
	}
}

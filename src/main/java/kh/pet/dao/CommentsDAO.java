package kh.pet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.CommentsDTO;

@Repository
public class CommentsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글 작성
	public int insert(CommentsDTO cm_dto) {
		return mybatis.insert("Comments.insert", cm_dto);
	}
	
	//댓글 보기
	public List<CommentsDTO> commentsAll(int cm_parent_seq){
		return mybatis.selectList("Comments.selectAll",cm_parent_seq);
	}
	
	//댓글 수정
	public int update(CommentsDTO cm_dto) {
		return mybatis.update("Comments.update", cm_dto);
	}
	
	//댓글 삭제
	public int delete(int cm_seq) {
		return mybatis.delete("Comments.delete", cm_seq);
	}
	
	
}

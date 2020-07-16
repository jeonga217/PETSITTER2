package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.CommunityDTO;
import kh.pet.dto.CommunityListDTO;
import kh.pet.dto.ReportDTO;

@Repository
public class CommunityDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	//게시글 작성
	public int insert(CommunityDTO cu_dto) {
		return mybatis.insert("Communityboard.insert", cu_dto);
	}

	//게시판 글의 총 개수 구하기	
	public int selectCount() {
		return mybatis.selectOne("Communityboard.selectCount");
	}

	//게시판 목록출력하기
	public List<CommunityListDTO> communityAll(Map<String, Integer> number) {
		return mybatis.selectList("Communityboard.selectAll", number);
	}

	//게시글 확인시 조회수 1증가
	public int viewcnt(Map<String,Integer> numcnt) {
		return mybatis.update("Communityboard.viewcnt", numcnt);
	}

	//게시글 보기
	public CommunityListDTO view(int cu_seq) {
		return mybatis.selectOne("Communityboard.selectOne",cu_seq);
	}

	//게시글 수정
	public int updateProc(CommunityDTO cu_dto) {
		return mybatis.update("Communityboard.update", cu_dto);
	}

	//게시글 삭제
	public int delete(int cu_seq) {
		return mybatis.delete("Communityboard.delete", cu_seq);
	}



	//검색용

	//게시글 검색
	public List<CommunityListDTO> search(Map<String,Object> searchOption) {
		return mybatis.selectList("Communityboard.selectSearch", searchOption);
	}

	//검색한 게시글 글의 총 개수 구하기	
	public int searchCount(Map<String,Object> keyword) {
		return mybatis.selectOne("Communityboard.searchCount",keyword);
	}


	//신고 기능	
	public int insertReport(ReportDTO rdto) {
		return mybatis.insert("Communityboard.insert_report",rdto);
	}

}

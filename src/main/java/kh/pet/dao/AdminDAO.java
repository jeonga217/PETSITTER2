package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.Stop_memberDTO;
import kh.pet.dto.WaitlistDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	//게시판 관리
	public int board_state(Map<String, Object> edit_date) {
		return mybatis.update("Admin.board_state",edit_date);
	}
	
	//펫 시터 신청서 관리
	public List<PetsitterDTO> petsitter(){
		return mybatis.selectList("Admin.petsitter");
	}
	
	public int petaccept(String id) {
		return mybatis.update("Admin.petaccept",id);
	}
	
	public int petcencel(String id) {
		return mybatis.delete("Admin.petcencel",id);
	}
	
	
	//회원 관리
	public List<MemberDTO> memberlist(Map<String, Integer> map){
		return mybatis.selectList("Admin.memberlist",map);
	}
	
	public int membercount() {
		return mybatis.selectOne("Admin.membercount");
	}
	
	public int mem_stop(Stop_memberDTO dto) {
		mybatis.insert("Admin.mem_stop",dto);
		return mybatis.update("Admin.mem_state",dto);
	}
	
	public int mem_stop_update(Stop_memberDTO dto) {
		mybatis.update("Admin.mem_state",dto);
		return mybatis.update("Admin.mem_stop_update",dto);
	}
	
	public int mem_stop_search(String id) {
		return mybatis.selectOne("Admin.mem_stop_search", id);
	}
	
	//예약 관리  테이블
	public List<MemboardDto> re_memboard(){
		return mybatis.selectList("Admin.rememboard");		
	}
	public List<WaitlistDTO> re_psboard(){
		return mybatis.selectList("Admin.repsboard");
	}
	
}

package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.CommunityDTO;
import kh.pet.dto.CommunityListDTO;
import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.MessageDTO;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.ReportDTO;
import kh.pet.dto.ReserveDto;
import kh.pet.dto.Stop_memberDTO;
import kh.pet.dto.Visitor_countDTO;
import kh.pet.dto.WaitlistDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	//게시판 관리
	
	
	//게시글 콜
	public List<MemboardDto> m_board_list(Map<String, Object> map){
		return mybatis.selectList("Admin.m_board_call",map);
	}
	public List<PetsitterboardDTO> p_board_list(Map<String, Object> map){
		return mybatis.selectList("Admin.p_board_call",map);
	}
	public List<CommunityDTO> f_board_list(Map<String, Object> map){
		return mybatis.selectList("Admin.c_board_call",map);
	}
	
	//게시글 숫자
	public int boardcount(Map<String, String> map) {
		return mybatis.selectOne("Admin.boardcount",map);
	}
	
	
	//게시글 상태
	public int board_state(Map<String, Object> edit_date) {
		return mybatis.update("Admin.board_state",edit_date);
	}
	
	public void petsitter_time() {
		mybatis.update("Admin.petsitter_time");
	}
	
	//펫 시터 신청서 관리
	public List<PetsitterDTO> petsitter(Map<String,Object> map){
		return mybatis.selectList("Admin.petsitter",map);
	}
	
	public int pet_count() {
		return mybatis.selectOne("Admin.sittercount");
	}
	
	public int petaccept(String id) {
		return mybatis.update("Admin.petaccept",id);
	}
	
	public int petcencel(String id) {
		return mybatis.delete("Admin.petcencel",id);
	}
	
	
	//블랙 맴버 콜
	public List<MemberDTO> black_memberlist(Map<String, Integer> map){
		return mybatis.selectList("Admin.blackmem",map);
	}
	
	public int black_membercount() {
		return mybatis.selectOne("Admin.black_membercount");
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
		if(dto.getS_stop_day().contentEquals("no")) {
			return mybatis.delete("Admin.mem_stop_cancel",dto);
		}else {
			return mybatis.update("Admin.mem_stop_solve",dto.getStop_id());
		}
	}
	
	public int mem_stop_search(String id) {
		return mybatis.selectOne("Admin.mem_stop_search", id);
	}
	
	public void mem_stop_count() {
		mybatis.update("Admin.mem_stop_count");
	}
	
	public int mem_solve(String id) {
		mybatis.update("Admin.mem_stop_solve",id);
		return mybatis.delete("Admin.mem_stop_cancel",id);
	}
	
	public void mem_stop_solve(List<Stop_memberDTO> list) {
		for(int i = 0; i < list.size(); i ++) {
			String id =  list.get(i).getStop_id();
			mybatis.delete("Admin.mem_stop_cancel",id);
			mybatis.update("Admin.mem_stop_solve",id);
		}
	}
	
	
	public List<Stop_memberDTO> mem_stop_solve_search(){
		return mybatis.selectList("Admin.mem_stop_solve_search");
	}
	
	//예약 관리  테이블
	public List<MemboardDto> re_memboard(Map<String, Integer> map){
		return mybatis.selectList("Admin.rememboard",map);		
	}
	
	public int re_memberCount() {
		return mybatis.selectOne("Admin.re_memboardCount");
	}
	
	public int re_psCount() {
		return mybatis.selectOne("Admin.re_pscount");
	}
	
	public int accept_memboard(Map<String, String> seq) {
		return mybatis.update("Admin.accept_mem_board",seq);
	}
	
	public List<WaitlistDTO> re_psboard(Map<String, Integer> map){
		return mybatis.selectList("Admin.repsboard",map);
	}
	
	public int cancel_memboard(String seq) {
		return mybatis.update("Admin.cancel_mem_board",seq);
	}
	
	public WaitlistDTO accept_pet_info(int wait_seq) {
		return mybatis.selectOne("Admin.accept_pet_info",wait_seq);
	}
	
	public int accept_pet_rsv(ReserveDto dto) {
		return mybatis.insert("Admin.accept_pet_rsv",dto);
	}
	
	public void accept_del_rsv(int wait_seq) {
		mybatis.delete("Admin.del_rsv",wait_seq);
	}
	
	public int cancel_pettsiter(int seq) {
		return mybatis.delete("Admin.del_rsv",seq);
	}
	
	//차트 관련 프로그램
	public List<Visitor_countDTO> be_visiter(){
		return mybatis.selectList("Admin.be_week");
	}
	
	public List<Visitor_countDTO> to_visiter(){
		return mybatis.selectList("Admin.to_week");
	}
	
	public void v_count_insert(int v_count) {
		mybatis.selectOne("Admin.record_count",v_count);
	}
	
	public void v_count_update(int v_count) {
		mybatis.selectOne("Admin.record_update",v_count);
	}
	
	//신고 관련 테이블
	public List<ReportDTO> reportlist(Map<String, Integer> map){
		return mybatis.selectList("Admin.reportlist",map);
	}
	
	//관리자 패스워드 변경
	public int admin_pass(String pw) {
		return mybatis.update("Admin.admin_password",pw);
	}
	
	//관리자 메세지 관리
	public List<MessageDTO> message(Map<String, Integer> map){
		return mybatis.selectList("Admin.admin_messagelist",map);
	} 
	public int message_count() {
		return mybatis.selectOne("Admin.message_count");
	}
}

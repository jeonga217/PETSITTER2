package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MemboardDto;
import kh.pet.dto.Mypet_regDTO;


@Repository
public class PetDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Mypet_regDTO> Petselect(String id){
		return mybatis.selectList("membd.petselect",id);
	}

	public MemboardDto bopet(String seq){
		return mybatis.selectOne("membd.bopet",seq);
	}
	
	public int Memboardinsert(MemboardDto mdto) {
		return mybatis.insert("membd.memboardinsert", mdto);
	}
	
	public MemboardDto redlist(String seq){
		return mybatis.selectOne("membd.redlist",seq);
	}
	
	public String petphoto(Mypet_regDTO pdto) {
		return mybatis.selectOne("membd.petphoto", pdto);
	}
	
	public String gettime(String time) {
		return mybatis.selectOne("membd.gettime", time);
	}
	
	public String getpettype(String petname) {
		return mybatis.selectOne("membd.getpettype",petname);
	}
	
	public MemboardDto modlist(String mb_seq) {
		return mybatis.selectOne("membd.modlist", mb_seq);
	}
	
	public int Memboardupdate(MemboardDto mdto) {
		return mybatis.update("membd.Memboardupdate", mdto);
	}
	
	public int applyup(MemboardDto mbdto) {
		return mybatis.update("membd.applyup",mbdto);
	}
	
	public int applydown(String seq) {
		return mybatis.update("membd.applydown",seq);
	}
	
	public int reservdel(String seq) {
		return mybatis.delete("membd.reservdel",seq);
	}
	
	public int mpointup(MemboardDto mbdto) {
		return mybatis.update("membd.mpointup",mbdto);
	}
	
	public int ppointup(MemboardDto mbdto) {
		return mybatis.update("membd.ppointup",mbdto);
	}
	
	public int reserv_point(MemboardDto mbdto) {
		return mybatis.insert("membd.reserv_point",mbdto);
	}

	public int mpoint(String id) {
		return mybatis.selectOne("membd.mpoint",id);
	}
	
	public List<MemboardDto> mb_boardList(Map<String,Integer> con){
		return mybatis.selectList("membd.mb_boardList",con);
	}
	
	public int getArticleCount() {
		return mybatis.selectOne("membd.getArticleCount");
	}
	
	public int deleteboard(MemboardDto mdto) {
		return mybatis.delete("membd.deleteboard", mdto);
	}
	
	public List<MemboardDto> seqid(String id) {
		System.out.println(id);
		return mybatis.selectList("membd.seqid",id);
	}
	
	public String addselec(String id) {
		return mybatis.selectOne("membd.addselec",id);
	}
	
	public int petsitter(String id) {
		return mybatis.selectOne("membd.petsitter",id);
	}
	
	public List<MemboardDto> petselname(String id){
		return mybatis.selectList("membd.petselname",id);
	}
}

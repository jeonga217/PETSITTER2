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
	
	public int Memboardinsert(MemboardDto mdto) {
		return mybatis.insert("membd.memboardinsert", mdto);
	}
	
	public MemboardDto redlist(String seq){
		System.out.println(seq);
		return mybatis.selectOne("membd.redlist",seq);
	}
	
	public String petphoto(Mypet_regDTO pdto) {
		return mybatis.selectOne("membd.petphoto", pdto);
	}
	
	public String gettime(String time) {
		return mybatis.selectOne("membd.gettime", time);
	}
	
	public String getpettype(Mypet_regDTO pdto) {
		return mybatis.selectOne("membd.getpettype",pdto);
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

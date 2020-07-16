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
	
	public List<Mypet_regDTO> Petselect(String id) throws Exception {
		return mybatis.selectList("membd.petselect",id);
	}

	public MemboardDto bopet(String seq) throws Exception {
		return mybatis.selectOne("membd.bopet",seq);
	}
	
	public int Memboardinsert(MemboardDto mdto) throws Exception {
		return mybatis.insert("membd.memboardinsert", mdto);
	}
	
	public MemboardDto redlist(String seq) throws Exception {
		return mybatis.selectOne("membd.redlist",seq);
	}
	
	public String petphoto(Mypet_regDTO pdto) throws Exception {
		return mybatis.selectOne("membd.petphoto", pdto);
	}
	
	public String gettime(String time) throws Exception {
		return mybatis.selectOne("membd.gettime", time);
	}
	
	public String getpettype(String petname) throws Exception {
		return mybatis.selectOne("membd.getpettype",petname);
	}
	
	public MemboardDto modlist(String mb_seq) throws Exception {
		return mybatis.selectOne("membd.modlist", mb_seq);
	}
	
	public int Memboardupdate(MemboardDto mdto) throws Exception {
		return mybatis.update("membd.Memboardupdate", mdto);
	}
	
	public int applyup(MemboardDto mbdto) throws Exception {
		return mybatis.update("membd.applyup",mbdto);
	}
	
	public int applydown(String seq) throws Exception {
		return mybatis.update("membd.applydown",seq);
	}
	
	public int reservdel(String seq) throws Exception {
		return mybatis.delete("membd.reservdel",seq);
	}
	
	public int mpointup(MemboardDto mbdto) throws Exception {
		return mybatis.update("membd.mpointup",mbdto);
	}
	
	public int ppointup(MemboardDto mbdto) throws Exception {
		return mybatis.update("membd.ppointup",mbdto);
	}
	
	public int reserv_point(MemboardDto mbdto) throws Exception {
		return mybatis.insert("membd.reserv_point",mbdto);
	}

	public int mpoint(String id) throws Exception {
		return mybatis.selectOne("membd.mpoint",id);
	}
	
	public List<MemboardDto> mb_boardList(Map<String,Integer> con) throws Exception {
		return mybatis.selectList("membd.mb_boardList",con);
	}
	
	public int getArticleCount() throws Exception {
		return mybatis.selectOne("membd.getArticleCount");
	}
	
	public int deleteboard(MemboardDto mdto) throws Exception {
		return mybatis.delete("membd.deleteboard", mdto);
	}
	
	public List<MemboardDto> seqid(String id) throws Exception {
		System.out.println(id);
		return mybatis.selectList("membd.seqid",id);
	}
	
	public String addselec(String id) throws Exception {
		return mybatis.selectOne("membd.addselec",id);
	}
	
	public int petsitter(String id) throws Exception {
		return mybatis.selectOne("membd.petsitter",id);
	}
	
	public List<MemboardDto> petselname(String id) throws Exception {
		return mybatis.selectList("membd.petselname",id);
	}
}

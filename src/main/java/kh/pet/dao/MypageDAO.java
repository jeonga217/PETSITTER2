package kh.pet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MyPage_CommunityDTO;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.dto.PointDTO;
import kh.pet.dto.RegLookupDTO;
import kh.pet.dto.Mypage_UseTableDTO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int pointcount(String id) {
		int counts = 0;
		int minus = 0;
		Map<String, String> list = new HashMap<String, String>();
		list.put("minus", "사용");
		list.put("minus1", "환전");
		list.put("id", id);
		List<Integer> count = mybatis.selectList("Pet_reg.pointcount", id);
		for (int i = 0; i < count.size(); i++) {
			counts += count.get(i);
		}
		List<Integer> pointminus = mybatis.selectList("Pet_reg.pointminus", list);
		for (int i = 0; i < pointminus.size(); i++) {
			minus += pointminus.get(i);
		}
		return counts - minus;
	}

	public List<PointDTO> pointall(String id) {
		List<PointDTO> list = mybatis.selectList("Pet_reg.pointlistall", id);
		return list;
	}

	public void insert(Mypet_regDTO dto) {
		mybatis.insert("Pet_reg.pet_insert", dto);
	}

	public List<Mypet_regDTO> selectAll(String id) {
		List<Mypet_regDTO> list = mybatis.selectList("Pet_reg.list", id);
		return list;
	}

	public Mypet_regDTO petlist(int seq) {
		Mypet_regDTO dto = mybatis.selectOne("Pet_reg.petlist", seq);
		return dto;
	}

	public void petdel(int seq) {
		mybatis.delete("Pet_reg.petdel", seq);
	}

	public String typecheck(String id) {
		String mem_type = mybatis.selectOne("Pet_reg.typecheck", id);
		return mem_type;
	}

	public List<RegLookupDTO> reglookup(String id) {
		
		List<RegLookupDTO> list = mybatis.selectList("Pet_reg.lookup", id);
		return list;
	}

	public List<MyPage_CommunityDTO> community(String id) {
		List<MyPage_CommunityDTO> list = mybatis.selectList("Pet_reg.community", id);
		return list;
	}
	
	public Mypet_regDTO modfiylist(String id, int seq) {
		Map<String, Object> modlist = new HashMap<String, Object>();
		modlist.put("id", id);
		modlist.put("seq", seq);
		Mypet_regDTO list = mybatis.selectOne("Pet_reg.modfiylist",modlist);
		return list;
	}

	public List<PointDTO> pointlist(String id) {
		List<PointDTO> list = mybatis.selectList("Pet_reg.point", id);
		return list;
	}

	public void pointinsert(String id, int pointnum, String add, String mem_type) {
		Map<String, Object> list = new HashMap<String, Object>();
		list.put("p_id", id);
		list.put("p_point", pointnum);
		list.put("p_method", add);
		list.put("mem_type", "2");
		mybatis.insert("Pet_reg.pointinsert", list);
	}
	
	public void petmodfiy(Mypet_regDTO dto) {
		mybatis.update("Pet_reg.petmodfiy",dto);
	}
	
	public String searchseq(int seq) {
		String imgname = mybatis.selectOne("Pet_reg.seq",seq);
		return imgname;
	}
	
	public List<Mypet_regDTO> petrest(String id, int seq) {
		Map<String, Object>  list = new HashMap<String, Object>();
		list.put("id", id);
		list.put("seq", seq);
		List<Mypet_regDTO> restlist = mybatis.selectList("Pet_reg.rest", list);
		return restlist;
	}
	
	public List<Mypage_UseTableDTO> usecontenttable(String id) {
		List<Mypage_UseTableDTO> use =  mybatis.selectList("Navi.usecontenttable", id);
		return use;
	}

}

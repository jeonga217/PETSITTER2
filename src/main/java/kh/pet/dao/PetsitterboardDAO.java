package kh.pet.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.CurrentReserveDTO;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.TotboardDTO;
import kh.pet.dto.WaitlistDTO;

@Repository
public class PetsitterboardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private HttpSession session;
	
	public String selectNextSeq() throws Exception{
		String seq = mybatis.selectOne("Board.selectNextSeq");
		String psb_seq = "ps"+seq;
		return psb_seq;
	}
	
	public List<Mypet_regDTO> selectMypet(String mem_id) throws Exception{
		return mybatis.selectList("Board.selectMypet", mem_id);
	}
	
	public int insert(TotboardDTO totdto) throws Exception{
		return mybatis.insert("Board.insertBoard",totdto);
	}
	
	public int insertwaitlist (WaitlistDTO wldto) throws Exception{
		return mybatis.insert("Board.insertWaitlist",wldto);
	}
	
	public PetsitterDTO selectBySeq(String psb_seq) throws Exception{
		return mybatis.selectOne("Board.selectBySeq",psb_seq);
	}
	
	public TotboardDTO selectBoard(String psb_writer,String psb_seq) throws Exception{
		Map<String, String> param =new HashMap<String, String>();
		param.put("writer",psb_writer);
		param.put("seq",psb_seq);
		return mybatis.selectOne("Board.selectBoard",param);
	}
	
	public List<PetsitterboardDTO> selectAll() throws Exception{
		return mybatis.selectList("Board.selectAll");
	}
	
	public int selectAllCnt()throws Exception{
		return mybatis.selectOne("Board.selectCntAll");
	}
	
	public int selectCnt(String psb_writer)throws Exception{
		return mybatis.selectOne("Board.selectCnt", psb_writer);
	}
	
	public List<PetsitterboardDTO> selectByPage(Map<String,Integer> page)throws Exception{
		return mybatis.selectList("Board.selectByPage", page);
	}
	
	public int createTb(List<Object> daylist) throws Exception{
		for(int i = 0; i < daylist.size(); i++) {
			mybatis.insert("Board.createTb",daylist.get(i));
		}
		return 1;
	}
	
	public List<CurrentReserveDTO> selectCurrentReserve (String psb_seq){
		return mybatis.selectList("Board.selectCurrentReserve",psb_seq);
	}
	
	public int checkExistReservation(String psb_seq) {
		return mybatis.selectOne("Board.checkExistReservation",psb_seq);
	}
	
	public int deleteBoard(String psb_seq) throws Exception{
		return mybatis.delete("Board.deleteBoard",psb_seq);
	}
	
	public int updateCurrentReserve(List<CurrentReserveDTO> reserve_list) throws Exception{
		for(int i=1;i<reserve_list.size();i++) {
			mybatis.update("Board.updateCurrentReserve",reserve_list.get(i));
		}
		return 1;
	}
	
	public List<Integer> selectPrice (List<Object> list)throws Exception{
		ArrayList<Integer> pricelist = new ArrayList<>();
		for(int i=0;i<list.size();i++) {
			System.out.println("¿©±â:"+list.get(i));
			pricelist.add(mybatis.selectOne("Board.selectPrice",list.get(i)));
		}
		return pricelist;
	}
	
//	public List<Date> selectFullday(String board_seq) throws Exception{
//		return mybatis.selectList("Board.selectFullday",board_seq);
//	}
}

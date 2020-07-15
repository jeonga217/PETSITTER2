package kh.pet.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.PetsitterboardDAO;
import kh.pet.dto.CurrentPickDTO;
import kh.pet.dto.CurrentReserveDTO;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.ReserveDto;
import kh.pet.dto.TotboardDTO;
import kh.pet.dto.WaitlistDTO;
import kh.pet.dto.timeDTO;
import kh.pet.staticInfo.PetSitterConfiguration;

@Service
public class PetsitterboardService {

	@Autowired
	private PetsitterboardDAO psbdao;
	
	public String selectNextSeq() throws Exception{
		return psbdao.selectNextSeq();
	}
	
	public int selectCnt(String psb_writer) throws Exception{
		//System.out.println("service:"+psb_writer);
		return psbdao.selectCnt(psb_writer);
	}
	
	public List<Mypet_regDTO> selectMypet(String mem_id)throws Exception{
		return psbdao.selectMypet(mem_id);
	}
	
	public int insert(TotboardDTO totdto) throws Exception{
		return psbdao.insert(totdto);
	}
	
	public int insertwaitlist(WaitlistDTO wldto)throws Exception{
		Date start_day = wldto.getRsv_start_day();
		Date end_day = wldto.getRsv_end_day();
		List<CurrentReserveDTO> reserve_list = new ArrayList<CurrentReserveDTO>();
		
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(start_day);
		
		long diff = Math.abs((end_day.getTime()-start_day.getTime())/(24*60*60*1000));
		
		for(int i=0;i<diff+1;i++) {
			CurrentReserveDTO cdto = new CurrentReserveDTO();
			cdto.setParent_board_seq(wldto.getBoard_seq());
			String pet_list[] = (wldto.getRsv_pet_name()).split(",");
			System.out.println("list길이:"+pet_list.length);
			if(i==0) {
				cdto.setS_cur_date(df.format(cal.getTime()));
			} else {
				cal.add(Calendar.DATE,1);
				cdto.setS_cur_date(df.format(cal.getTime()));
			}
			if(wldto.getRsv_time().contentEquals("am")) {
				cdto.setAm(pet_list.length);
				cdto.setPm(0);
			}
			else if(wldto.getRsv_time().contentEquals("pm")) {
				cdto.setPm(pet_list.length);
				cdto.setAm(0);
			}
			else {
				cdto.setAm(pet_list.length);
				cdto.setPm(pet_list.length);
			}	
			reserve_list.add(cdto);
		}
		
		psbdao.insertwaitlist(wldto);
		psbdao.updateCurrentReserve(reserve_list);
		return psbdao.updatePoint(wldto);
		
	}
	
	public List<PetsitterboardDTO> outputList(int cpage)throws Exception{
		int start = cpage*PetSitterConfiguration.recordPerPage - (PetSitterConfiguration.recordPerPage-1);
		int end = start +(PetSitterConfiguration.recordPerPage-1);
		HashMap<String, Integer> page = new HashMap<String, Integer>();
		 page.put("start", start);
		 page.put("end", end);
		 return psbdao.selectByPage(page);
	}
	
	public String getPageNavi(int cpage)throws Exception{
		int recordTotalCnt = psbdao.selectAllCnt();
		int recordPerPage = 10;
		int naviPerPage = 5;
		int totalPage = 0;
		
		if((recordTotalCnt%recordPerPage)>0) {
			totalPage = recordTotalCnt/recordPerPage+1;
		} else {
			totalPage = recordTotalCnt/recordPerPage;
		}
		
		if(cpage<1) {cpage=1;}
		else if(cpage>totalPage) {cpage=totalPage;}
		
		int startNavi = (cpage-1)/naviPerPage*naviPerPage+1;
		int endNavi = startNavi + (naviPerPage-1);
		
		if(endNavi>totalPage) {endNavi=totalPage;}
		 
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {needPrev=false;}
		if(endNavi==totalPage) {needNext=false;}
		
		StringBuilder sb = new StringBuilder();
		if(needPrev) {sb.append("<a href='/board/outputList?cpage="+(startNavi-1)+"'>< </a>");}
		for(int i=startNavi;i<=endNavi;i++) {sb.append("<a href='/board/outputList?cpage="+i+"'>"+i+"</a>");}
		if(needNext) {sb.append("<a href='/board/outputList?cpage="+(endNavi+1)+"'>></a>");}
		
		return sb.toString();
	}
	
	public TotboardDTO selectBoard(String psb_writer,String psb_seq) throws Exception{
		return psbdao.selectBoard(psb_writer,psb_seq);
	}
	
	public int createTb(List<Object> daylist) throws Exception{
		return psbdao.createTb(daylist);
	}
	
	public List<CurrentReserveDTO> selectCur_reserve(String psb_seq)throws Exception{
		return psbdao.selectCurrentReserve(psb_seq);
	}
	
	public int checkExistReservation(String psb_seq) throws Exception{
		return psbdao.checkExistReservation(psb_seq);
	}
	
	public int deleteBoard(String psb_seq) throws Exception{
		return psbdao.deleteBoard(psb_seq);
	}
	
	public List<Integer> selectPrice(List<Object> list) throws Exception{
		 return psbdao.selectPrice(list);
	}
	
	public int cancelReserve(String reserve_seq) throws Exception{
		ReserveDto rsvdto = psbdao.selectReserve(reserve_seq);
		Date start=rsvdto.getStart_day();
		Date end=rsvdto.getEnd_day();
		String pet_list[] = (rsvdto.getPet_name()).split(",");
		int pets =(-1)*pet_list.length;
		//System.out.println("펫마리수:"+pets);
		
		List<CurrentReserveDTO> reserve_list = new ArrayList<CurrentReserveDTO>();
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(start);
		
		long diff = Math.abs((end.getTime()-start.getTime())/(24*60*60*1000));

		for(int i=0;i<diff+1;i++) {
			CurrentReserveDTO cdto = new CurrentReserveDTO();
			cdto.setParent_board_seq(rsvdto.getPetsitter_board_seq());
			
			if(i==0) {
				cdto.setS_cur_date(df.format(cal.getTime()));
				//System.out.println(df.format(cal.getTime()));
			} else {
				cal.add(Calendar.DATE,1);
				cdto.setS_cur_date(df.format(cal.getTime()));
				//System.out.println(df.format(cal.getTime()));
			}
			if(rsvdto.getReserve_time().contentEquals("am")) {
				cdto.setAm(pets);
				cdto.setPm(0);
			}
			else if(rsvdto.getReserve_time().contentEquals("pm")) {
				cdto.setPm(pets);
				cdto.setAm(0);
			}
			else {
				cdto.setAm(pets);
				cdto.setPm(pets);
			}	
	
			reserve_list.add(cdto);
		}
		
		psbdao.cancelReserve(reserve_seq);
		return psbdao.updateCurrentReserve(reserve_list);
	}
	
	public boolean checkAvailableReserve(CurrentPickDTO pickdto)throws Exception{
		List<timeDTO> list = psbdao.checkAvailableReserve(pickdto);
		String[] timearr = pickdto.getTime().split(",");
		int count =0;
		if(timearr.length==2) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getPm()>=pickdto.getPets() && list.get(i).getAm()>=pickdto.getPets()) {
					count++;
				}
				
			}
		
		} else if(timearr.length==1) {
			if(timearr[0].contentEquals("am")) {
				for(int i=0;i<list.size();i++) {
					if(list.get(i).getAm()>=pickdto.getPets()) {
						count++;
					}
				}
			} else if(timearr[0].contentEquals("pm")) {
				for(int i=0;i<list.size();i++) {
					if(list.get(i).getPm()>=pickdto.getPets()) {
						count++;
					}
				}
				}
			} 			
			if(count==list.size()) {
				System.out.println("true"+count);
				return true;
						
			} else 
				return false;
		}
	
	public WaitlistDTO selectWaitlist(String mem_id) throws Exception{
		
		return psbdao.selectWaitlist(mem_id);
	}
}

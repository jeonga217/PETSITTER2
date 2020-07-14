package kh.pet.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.CommunityDAO;
import kh.pet.dto.CommunityDTO;
import kh.pet.dto.CommunityListDTO;
import kh.pet.dto.ReportDTO;
import kh.pet.staticInfo.Community_Configuration;

@Service
public class CommunityService {
	
	@Autowired
	private CommunityDAO cu_dao;
	
	//게시글 작성
	public int insert(CommunityDTO cu_dto)throws Exception{
		if(cu_dto.getCu_thumb() == "") {
			cu_dto.setCu_thumb("/uploadimage/32ddb23e-1552-43a4-afee-13a2af0b3513_고양이아이콘.jpg");
			return cu_dao.insert(cu_dto);
		}else {
			return cu_dao.insert(cu_dto);	
		}
	}
	
	//게시판 _ 페이지네비
		public String getPageNavi(int userCurrentPage) throws SQLException, Exception {
			int recordTotalCount = cu_dao.selectCount(); //총 게시물의 갯수. DB
		
			int pageTotalCount = 0; // 모든 페이지 개수
			
			if(recordTotalCount % Community_Configuration.RECORD_COUNT_PER_PAGE > 0) {
				pageTotalCount = recordTotalCount / Community_Configuration.RECORD_COUNT_PER_PAGE + 1;
			}else {
				pageTotalCount = recordTotalCount / Community_Configuration.RECORD_COUNT_PER_PAGE;
			}
			
			int currentPage = userCurrentPage;
			if(currentPage < 1) {
				currentPage = 1;
			}else if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			
			int startNavi = (currentPage - 1) / Community_Configuration.NAVI_COUNT_PER_PAGE * Community_Configuration.NAVI_COUNT_PER_PAGE + 1;
			
			int endNavi = startNavi + Community_Configuration.NAVI_COUNT_PER_PAGE - 1;
			
			if(endNavi > pageTotalCount) {endNavi = pageTotalCount;}
			
			boolean needPrev = true;
			boolean needNext = true;
			
			if(startNavi == 1) {needPrev = false;}
			if(endNavi == pageTotalCount) {needNext = false;}		
			
			StringBuilder sb = new StringBuilder();
			
			if(needPrev) {
				sb.append("<a href='/community/list?cpage="+(startNavi-1)+"'><</a>");
			}
			for(int i = startNavi ; i<=endNavi; i++) {

				sb.append("<a href='/community/list?cpage="+i+"'>"+i+"</a>");//꾸며주는 것
			}
			if(needNext) {

				sb.append("<a href='/community/list?cpage="+(endNavi+1)+"'>></a>");
			}
			
			return sb.toString();
		}
	
		
	//start,end값 구하기
	public List<CommunityListDTO> communityAll(int cpage) throws Exception{
		int start = cpage*Community_Configuration.RECORD_COUNT_PER_PAGE - (Community_Configuration.RECORD_COUNT_PER_PAGE-1);
		int end = start + (Community_Configuration.RECORD_COUNT_PER_PAGE-1);
		
		Map<String,Integer> number = new HashMap<String, Integer>();
		number.put("start", start);
		number.put("end", end);
		
		return cu_dao.communityAll(number);
		
	}
	
	
	
	//게시글 보기
	public CommunityListDTO view(int cu_seq,int cu_view_cnt) throws Exception {
		
		cu_view_cnt ++;
		
		Map<String,Integer> numcnt = new HashMap<String, Integer>();
		
		numcnt.put("cu_seq", cu_seq);
		numcnt.put("cu_view_cnt", cu_view_cnt);
		
		int result = cu_dao.viewcnt(numcnt);

		
		return cu_dao.view(cu_seq);
	}
	
	
	//게시글 수정
	public int updateProc(CommunityDTO cu_dto) throws Exception{
		
		return cu_dao.updateProc(cu_dto);
	}
	
	//게시글 삭제
	public int delete(int cu_seq) throws Exception{
		
		return cu_dao.delete(cu_seq);
	}
	

	//게시물 검색
	public List<CommunityListDTO> search(int cpage, String keyword, String search_option) throws Exception{
		int start = cpage*Community_Configuration.RECORD_COUNT_PER_PAGE - (Community_Configuration.RECORD_COUNT_PER_PAGE-1);
		int end = start + (Community_Configuration.RECORD_COUNT_PER_PAGE-1);
		
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("start", start);
		searchOption.put("end", end);
		searchOption.put("keyword", keyword);
		searchOption.put("search_option",search_option);
		
		return cu_dao.search(searchOption);
	}
	
	//검색 게시판 _ 페이지네비
			public String getSearchPageNavi(int userCurrentPage,String keyword, String search_option) throws SQLException, Exception {
				
				Map<String, Object> searchOption = new HashMap<String, Object>();
				searchOption.put("keyword", keyword);
				searchOption.put("search_option",search_option);
				int recordTotalCount = cu_dao.searchCount(searchOption); //총 게시물의 갯수. DB
			
				int pageTotalCount = 0; // 모든 페이지 개수
				
				if(recordTotalCount % Community_Configuration.RECORD_COUNT_PER_PAGE > 0) {
					pageTotalCount = recordTotalCount / Community_Configuration.RECORD_COUNT_PER_PAGE + 1;
				}else {
					pageTotalCount = recordTotalCount / Community_Configuration.RECORD_COUNT_PER_PAGE;
				}
				
				int currentPage = userCurrentPage;
				if(currentPage < 1) {
					currentPage = 1;
				}else if(currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}
				
				int startNavi = (currentPage - 1) / Community_Configuration.NAVI_COUNT_PER_PAGE * Community_Configuration.NAVI_COUNT_PER_PAGE + 1;
				
				int endNavi = startNavi + Community_Configuration.NAVI_COUNT_PER_PAGE - 1;
				
				if(endNavi > pageTotalCount) {endNavi = pageTotalCount;}
				
				boolean needPrev = true;
				boolean needNext = true;
				
				if(startNavi == 1) {needPrev = false;}
				if(endNavi == pageTotalCount) {needNext = false;}		
				
				StringBuilder sb = new StringBuilder();
				
				if(needPrev) {
					sb.append("<a href='/community/search?cpage="+(startNavi-1)+"&keyword="+keyword+"&search_option="+search_option+"'><</a>");
				}
				for(int i = startNavi ; i<=endNavi; i++) {

					sb.append("<a href='/community/search?cpage="+i+"&keyword="+keyword+"&search_option="+search_option+"'>"+i+"</a>");
				}
				if(needNext) {

					sb.append("<a href='/community/search?cpage="+(endNavi+1)+"&keyword="+keyword+"&search_option="+search_option+"'></a>");
				}
				
				return sb.toString();
			}
	
	
			//신고 기능
			public int insertReport(int r_parent_seq, String report_id, ReportDTO r_dto) {
				
				r_dto.setR_parent_seq(r_parent_seq);
				r_dto.setReport_id(report_id);
				
				return cu_dao.insertReport(r_dto);
			}

}

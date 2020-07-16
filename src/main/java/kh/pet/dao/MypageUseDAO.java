package kh.pet.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MemberDTO;
import kh.pet.dto.Mypage_UseTableDTO;
import kh.pet.staticInfo.Main_Configuration;

@Repository
public class MypageUseDAO {
	@Autowired
	private SqlSessionTemplate mybaits;

	@Autowired
	HttpSession session;

	public int getArticleCount(String name) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int result = mybaits.selectOne(name, dto.getMem_id());
		return result;
	}

	public List<Object> selectByPageNo(int cpage, String id, String name) throws Exception {
		if (name.contentEquals("usecontent")) {
			Main_Configuration.recordCountPerPage = 5;
			Main_Configuration.naviCountPerPage = 5;
		}
		int start = cpage * Main_Configuration.recordCountPerPage - (Main_Configuration.recordCountPerPage - 1);
		int end = start + (Main_Configuration.recordCountPerPage - 1);
		Map<String, Object> se = new HashMap<String, Object>();
		se.put("start", start);
		se.put("end", end);
		se.put("id", id);
		if (name.contentEquals("usecontent")) {
			List<Object> full = new ArrayList<>();
			List<Object> list = mybaits.selectList("Navi.usecontenttable", se);
			List<Object> list1 = mybaits.selectList("Navi.usecontenttable1",se);
			full.add(list);
			full.add(list1);
			return full;
		}
		return null;
	}

	public String getPageNavi(int currentPage, String name) throws Exception {
		System.out.println("보여줄 갯수 : "+Main_Configuration.recordCountPerPage);
		System.out.println("네비바 갯수 : "+Main_Configuration.naviCountPerPage);
		int recordTotalCount = 0;
		if (name.contentEquals("usecontent")) {
			recordTotalCount = getArticleCount("Navi.usecount");
		}
		
		System.out.println("검색된 갯수  : "+recordTotalCount);
		
		int pageTotalCount = 0;
		if ((recordTotalCount % Main_Configuration.recordCountPerPage != 0)) {
			pageTotalCount = (recordTotalCount / Main_Configuration.recordCountPerPage) + 1;
		} else {
			pageTotalCount = (recordTotalCount / Main_Configuration.recordCountPerPage);
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		
		int startNavi = (currentPage - 1) / Main_Configuration.recordCountPerPage
				* Main_Configuration.recordCountPerPage + 1;
		int endNavi = startNavi + Main_Configuration.naviCountPerPage - 1;
		
		System.out.println("시작 : "+startNavi);
		System.out.println("끝 : "+endNavi);
		
		if (pageTotalCount < endNavi) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		StringBuilder sb = new StringBuilder();

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		if (needPrev) {
			sb.append("<a href='" + name + "?cpage=" + (startNavi - 1) + "'> < </a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {

			sb.append("<a href='" + name + "?cpage=" + i + "'>" + i + " " + "</a>");
		}
		if (needNext) {
			sb.append("<a href='" + name + "?cpage=" + (endNavi + 1) + "'> > </a>");
		}
		System.out.println("보냄 : "+ sb.toString());
		return sb.toString();
	}

	public List<Mypage_UseTableDTO> statueday(String id) {
		List<Mypage_UseTableDTO> day = mybaits.selectList("Navi.statuday", id);
		return day;
	}

}

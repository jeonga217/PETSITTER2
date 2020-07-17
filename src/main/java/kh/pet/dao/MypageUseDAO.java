package kh.pet.dao;

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

	public List<Mypage_UseTableDTO> selectByPageNo(int cpage, String id, String name) throws Exception {
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
		List<Mypage_UseTableDTO> uselist = mybaits.selectList("Navi.uselist", se);
		return uselist;
	}
	public String getPageNavi(int currentPage, String name) throws Exception {
		int recordTotalCount = 0;
		if (name.contentEquals("usecontent")) {
			recordTotalCount = getArticleCount("Navi.usecount");
			System.out.println("번호 : " + recordTotalCount);
		}

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
		System.out.println(sb.toString());
		return sb.toString();
	}

	public List<Mypage_UseTableDTO> statueday(String id, int cpage)throws Exception {
		System.out.println("현재페이지 : "+cpage);
		int recordTotalCount = 0;
		recordTotalCount = getArticleCount("Navi.usecount");
		
		
		int start = cpage * Main_Configuration.recordCountPerPage - (Main_Configuration.recordCountPerPage - 1);
		int end = start + (Main_Configuration.recordCountPerPage - 1);
		
		
		Map<String, Object> list = new HashMap<>();
		list.put("id", id);
		list.put("start",start);
		list.put("end", end);
		System.out.println("시작은 : "+start);
		System.out.println("끝은 : "+end);
		List<Mypage_UseTableDTO> day = mybaits.selectList("Navi.statuday", list);
		return day;
	}

}

package kh.pet.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.MypageUseDAO;
import kh.pet.dto.Mypage_UseTableDTO;

@Service
public class UseService {
	@Autowired
	private MypageUseDAO udao;

	// �꽕鍮� 諛�
	public List<Object> selectByPageNo(int cpage, String id, String name) throws Exception {
		List<Object> dto = udao.selectByPageNo(cpage, id, name);
		return dto;
	}

	// �꽕鍮� 諛�
	public String getPageNavi(int cpage, String name) throws Exception {
		String navi = udao.getPageNavi(cpage, name);
		return navi;
	}

	public List<String> usestate(String id) {
		List<Mypage_UseTableDTO> day = udao.statueday(id);
		List<String> list = new ArrayList<String>();
		for(int i = 0; i<day.size(); i++) {
			Date start = day.get(i).getStart_day();
			Date end = day.get(i).getEnd_day();
		    Date reserve = day.get(i).getReserve_day();
			if(reserve.before(start)) {
				list.add("예약대기");
			}else if(reserve.after(start) && reserve.before(end)) {
				list.add("서비스중");
			}
			else if(reserve.after(end)) {
				list.add("서비스종료");
			}
		}
		return list;
	}
}

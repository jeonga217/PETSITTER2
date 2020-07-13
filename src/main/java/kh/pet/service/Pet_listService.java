package kh.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.NaviDAO;
@Service
public class Pet_listService {

	@Autowired
	private NaviDAO ndao;
	// �꽕鍮� 諛�
	public List<Object> selectByPageNo(int cpage, String id, String name) throws Exception{
		List<Object> dto = ndao.selectByPageNo(cpage, id, name);
		return dto;
	}
	// �꽕鍮� 諛�
	public String getPageNavi(int cpage, String name)throws Exception{
		String  navi = ndao.getPageNavi(cpage,name);
		return navi;
	}
	
}

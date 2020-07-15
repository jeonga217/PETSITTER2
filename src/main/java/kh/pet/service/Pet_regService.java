package kh.pet.service;

import java.io.File;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dao.MypageDAO;
import kh.pet.dto.Mypet_regDTO;
@Service
public class Pet_regService {

	@Autowired
	MypageDAO mydao;

	@Autowired
	HttpSession session;

	public void reg(String id, Mypet_regDTO dto, MultipartFile img) throws Exception{
		//폴더 만들어 주는 코드
		String filePath = session.getServletContext().getRealPath("upload");
		System.out.println(filePath);
		File local = new File(filePath);
		if(!local.exists()) {
			local.mkdir();
		}
		
		//파일 이름 지정 및 업로드 하는 코드
		String systemFileName = System.currentTimeMillis()+ "_"+ img.getOriginalFilename();
		File targetLoc = new File(filePath + "/"+systemFileName);
		img.transferTo(targetLoc);
		
		dto.setMaster_id(id);
		dto.setPet_photo(systemFileName);
		mydao.insert(dto);
	}
}

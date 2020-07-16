package kh.pet.service;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dao.MypageDAO;
import kh.pet.dto.Mypet_regDTO;

@Service
public class Mypage_petmodfiyService {

	@Autowired
	private MypageDAO mdao;

	@Autowired
	HttpSession session;

	public void modfiy(Mypet_regDTO dto, MultipartFile img) throws Exception {
System.out.println("처음 이미지 : "+img);
		if (img.getOriginalFilename() != "") {
			String imgname = mdao.searchseq(dto.getPetseq());
			String filePath = session.getServletContext().getRealPath("upload");
			File file = new File(filePath + "/" + imgname);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
					String systemFileName = System.currentTimeMillis() + "_" + img.getOriginalFilename();
					File targetLoc = new File(filePath + "/" + systemFileName);
					img.transferTo(targetLoc);
					dto.setPet_photo(systemFileName);
					mdao.petmodfiy(dto);
				} else {
					System.out.println("파일삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
		} else {
			String imgname = mdao.searchseq(dto.getPetseq());
			String filePath = session.getServletContext().getRealPath("upload");
			File file = new File(filePath + "/" + imgname);
			if (file.exists()) {
				dto.setPet_photo(imgname);
				mdao.petmodfiy(dto);
			}else {
				System.out.println("파일이 없습니다");
			}
		}

	}
}

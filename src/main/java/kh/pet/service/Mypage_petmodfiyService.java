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
System.out.println("ó�� �̹��� : "+img);
		if (img.getOriginalFilename() != "") {
			String imgname = mdao.searchseq(dto.getPetseq());
			String filePath = session.getServletContext().getRealPath("upload");
			File file = new File(filePath + "/" + imgname);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("���ϻ��� ����");
					String systemFileName = System.currentTimeMillis() + "_" + img.getOriginalFilename();
					File targetLoc = new File(filePath + "/" + systemFileName);
					img.transferTo(targetLoc);
					dto.setPet_photo(systemFileName);
					mdao.petmodfiy(dto);
				} else {
					System.out.println("���ϻ��� ����");
				}
			} else {
				System.out.println("������ �������� �ʽ��ϴ�.");
			}
		} else {
			String imgname = mdao.searchseq(dto.getPetseq());
			String filePath = session.getServletContext().getRealPath("upload");
			File file = new File(filePath + "/" + imgname);
			if (file.exists()) {
				dto.setPet_photo(imgname);
				mdao.petmodfiy(dto);
			}else {
				System.out.println("������ �����ϴ�");
			}
		}

	}
	
}

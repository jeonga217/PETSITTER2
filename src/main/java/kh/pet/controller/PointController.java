package kh.pet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.service.Petservice;

@Controller
@RequestMapping("/point/")
public class PointController {
	
	@Autowired
	private Petservice service; 
	@Autowired
	private HttpSession session;	

	@RequestMapping("cancel")
	public void cancel(String seq,MemboardDto mbdto) {
		MemboardDto mdto = service.modlist(seq);
		service.reservdel(seq);
		int mpoint = service.mpoint(mdto.getMb_writer());
		int apoint = mdto.getMb_point();
		service.applydown(seq);
		int vpoint = mpoint+apoint;
		mdto.setMb_point(vpoint);
		service.mpointup(mdto);
	}
	
	@RequestMapping("scpoint")
	public void petsitter_pointup(String seq) {
		MemboardDto mdto = service.modlist(seq);
		int ppoint = service.mpoint(mdto.getMb_booker());
		int apoint = mdto.getMb_point();
		int vpoint = ppoint+apoint;
		mdto.setMb_point(vpoint);
		service.ppointup(mdto);
	}

	//	soju point
	@RequestMapping("apply")
	public void apply(MemboardDto mbdto,HttpServletResponse response) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		JSONObject jobj = new JSONObject();
		int mpoint = service.mpoint(mbdto.getMb_writer());
		String re = "false";
		if(mpoint>mbdto.getMb_point()) {
			int vpoint = mpoint - mbdto.getMb_point();
			if(!mdto.getMem_id().contentEquals(mbdto.getMb_writer())) {
				mbdto.setMb_booker(mdto.getMem_id());
				service.applyup(mbdto);
				service.reserv_point(mbdto);
				mbdto.setMb_point(vpoint);
				System.out.println(mbdto.getMb_point());
				service.mpointup(mbdto);
				re = "true";
			}
		}
		jobj.put("re", re) ;
		try {
			response.getWriter().append(jobj.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

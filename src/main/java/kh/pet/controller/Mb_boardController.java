package kh.pet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.service.Petservice;

@Controller
@RequestMapping("/mb/")
public class Mb_boardController {

	@Autowired
	private Petservice service; 
	@Autowired
	private HttpSession session;	
	
	@RequestMapping("home")
	public String home(Model m) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		List<Mypet_regDTO> list = service.Petselect(mdto.getMem_id());
		String add = service.addselec(mdto.getMem_id());
		
		m.addAttribute("list", list);
		m.addAttribute("add", add);
		return "mb_board/board_register";
	}

	
	@RequestMapping("index")
	public String index(MemboardDto mbdto) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		mbdto.setMb_writer(mdto.getMem_id());
		service.Memboardinsert(mbdto);

		return "redirect:redlist";
	}


	@RequestMapping("redlist")
	public String redlist(Model m,MemboardDto mbdto,Mypet_regDTO pdto) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		pdto.setMaster_id(mdto.getMem_id());
		String add = service.addselec(mdto.getMem_id());
		List<MemboardDto> dtolist  = service.seqid(mdto.getMem_id());
		MemboardDto mlist = service.redlist(dtolist.get(0).getMb_seq());
		String[] servicearr = mlist.getMb_service().split(",");
		String[] petnamearr = mlist.getMb_pet_name().split(",");
		List<String> pettype = new ArrayList<>();
		List<String> petphoto = new ArrayList<>();
		List<String> services = new ArrayList<>();
		for(String petname : petnamearr) {
			pdto.setPet_name(petname);
			pettype.add(service.getpettype(pdto));
		}
		for(String petname : petnamearr) {

			petphoto.add(service.petphoto(petname));
		}
		for(String service : servicearr) {
			services.add(service);
		}
		String[] stimearr = mlist.getMb_stime().split(":");
		String[] etimearr = mlist.getMb_etime().split(":");
		int stime = Integer.parseInt(stimearr[0]);
		int etime = Integer.parseInt(etimearr[0]);
		int timesub = stime - etime;
		String[]  alltimearr = Integer.toString(timesub).split("-");
		int alltime = Integer.parseInt(alltimearr[1]);
		System.out.println(alltime);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", mdto.getMem_id());
		m.addAttribute("petphoto", petphoto);
		
		return "mb_board/board";
	}

	// 占쎈땾占쎌젟 �뀎占�	
	@RequestMapping("modfilist")
	public String modfilist(Model m,MemboardDto mbdto,Mypet_regDTO pdto) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		pdto.setMaster_id(mdto.getMem_id());
		String add = service.addselec(mdto.getMem_id());
		MemboardDto mlist = service.redlist(mbdto.getMb_seq());
		String[] servicearr = mlist.getMb_service().split(",");
		String[] petnamearr = mlist.getMb_pet_name().split(",");
		List<String> pettype = new ArrayList<>();
		List<String> petphoto = new ArrayList<>();
		List<String> services = new ArrayList<>();
		for(String petname : petnamearr) {
			pdto.setPet_name(petname);
			pettype.add(service.getpettype(pdto));
		}
		for(String petname : petnamearr) {

			petphoto.add(service.petphoto(petname));
		}
		for(String service : servicearr) {
			services.add(service);
		}
		String[] stimearr = mlist.getMb_stime().split(":");
		String[] etimearr = mlist.getMb_etime().split(":");
		int stime = Integer.parseInt(stimearr[0]);
		int etime = Integer.parseInt(etimearr[0]);
		int timesub = stime - etime;
		String[]  alltimearr = Integer.toString(timesub).split("-");
		int alltime = Integer.parseInt(alltimearr[1]);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", mdto.getMem_id());
		m.addAttribute("petphoto", petphoto);
		m.addAttribute("alltime",alltime);
		return "mb_board/board";
	}

	@RequestMapping("modified")
	public String redlist_modified(Model m,String mb_seq) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		MemboardDto modlist = service.modlist(mb_seq);
		String[] petnamearr = modlist.getMb_pet_name().split(",");
		String[] servicearr = modlist.getMb_service().split(",");
		List<String> petnames = new ArrayList<>();
		List<String> services = new ArrayList<>();
		for(String service : servicearr) {
			services.add(service);
		}

		for(String petname : petnamearr) {
			petnames.add(petname);
		}
		List<Mypet_regDTO> list = service.Petselect(mdto.getMem_id());

		String add = service.addselec(modlist.getMb_writer());
		m.addAttribute("list", list);
		m.addAttribute("add", add);	
		m.addAttribute("modlist", modlist);	
		m.addAttribute("petnames", petnames);	
		m.addAttribute("services", services);

		return "mb_board/board_Modified";
	}

	@RequestMapping("modified_con")
	public String modified_con(MemboardDto mbdto,Model m) {
		service.Memboardupdate(mbdto);	
		m.addAttribute("mb_seq", mbdto.getMb_seq());
		return "redirect:modfilist";
	}

	@RequestMapping("mb_board")
	public String mb_board(Model m,HttpServletRequest req) throws Exception{
		int cpage = 1;
		try {
			cpage= Integer.parseInt(req.getParameter("cpage"));
		} catch(Exception e) {}

		List<MemboardDto> mblist = service.mb_boardList(cpage);
		for(MemboardDto mb : mblist) {
			if(mb.getMb_petphoto() != null) {
				String[] photoarr = mb.getMb_petphoto().split(",",-1);
				mb.setPhoto(photoarr);
			}
		}
		String navi = service.getPageNavi(cpage);
		m.addAttribute("navi", navi);
		m.addAttribute("mblist", mblist);
		return "mb_board/board_list";
	}

	@RequestMapping("deleteboard")
	public String deleteboard(MemboardDto mbdto) {
		service.deleteboard(mbdto);
		return "redirect:mb_board";
	}

	@RequestMapping("apply")
	public void apply(MemboardDto mbdto,HttpServletResponse response) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		JSONObject jobj = new JSONObject();
	  
       String re = "false";
		if(!mdto.getMem_id().contentEquals(mbdto.getMb_writer())) {
			mbdto.setMb_booker(mdto.getMem_id());
			service.applyup(mbdto);
			re = "true";
		}
		jobj.put("re", re) ;
		try {
			response.getWriter().append(jobj.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package kh.pet.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String home(Model m) throws Exception {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		String add = service.addselec(mdto.getMem_id());
		List<Mypet_regDTO> list = service.Petselect(mdto.getMem_id());
		List<MemboardDto> plist = service.petselname(mdto.getMem_id());
		List<String[]> petarr = new ArrayList<>();
		List<String> petname = new ArrayList<>();

		for(MemboardDto petlist : plist) {
			petarr.add(petlist.getMb_pet_name().split(","));
		}

		for(String[] PetNameList : petarr) {
			for(String PetNameArr : PetNameList) {
				petname.add(PetNameArr);
			}
		}

		for(Mypet_regDTO a: list) {
			System.out.println("a"+a.getPet_name());
		}
		for(String b: petname) {
			System.out.println("b"+b);
		}
		m.addAttribute("petname",petname);
		m.addAttribute("list", list);
		m.addAttribute("add", add);
		return "mb_board/board_register";
	}


	@RequestMapping("index")
	public String index(MemboardDto mbdto) throws Exception {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		mbdto.setMb_writer(mdto.getMem_id());
		service.Memboardinsert(mbdto);

		return "redirect:mbinset";
	}


	@RequestMapping("mbinset")
	public String redlist(Model m,MemboardDto mbdto,Mypet_regDTO pdto) throws Exception {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		pdto.setMaster_id(mdto.getMem_id());
		int petResult = service.petsitter(mdto.getMem_id());
		String add = service.addselec(mdto.getMem_id());
		List<MemboardDto> dtolist = service.seqid(mdto.getMem_id());
		MemboardDto mlist = service.redlist(dtolist.get(0).getMb_seq());	
		String[] servicearr = mlist.getMb_service().split(",");
		String[] petnamearr = mlist.getMb_pet_name().split(",");
		List<String> pettype = new ArrayList<String>();
		List<String> services = new ArrayList<String>();


		for(String petname : petnamearr) {
			pdto.setPet_name(petname);
			pdto.setMaster_id(mdto.getMem_id());
			pettype.add(service.getpettype(petname));	
		}

		if(mlist.getMb_petphoto() != null) {
			String[] photoarr = mlist.getMb_petphoto().split(",",-1);
			mlist.setPhoto(photoarr);
		}
		for(String service : servicearr) {services.add(service);}
		String[] stimearr = mlist.getMb_stime().split(":");
		String[] etimearr = mlist.getMb_etime().split(":");
		int stime = Integer.parseInt(stimearr[0]);
		int etime = Integer.parseInt(etimearr[0]);
		int timesub = stime - etime;
		String[]  alltimearr = Integer.toString(timesub).split("-");
		int alltime = Integer.parseInt(alltimearr[1]);
		m.addAttribute("petResult",petResult);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", mdto.getMem_id());
		m.addAttribute("alltime",alltime);
		return "mb_board/board";
	}

	@RequestMapping("modfilist")
	public String modfilist(Model m,MemboardDto mbdto,Mypet_regDTO pdto) throws Exception {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		int petResult = service.petsitter(mdto.getMem_id());
		pdto.setMaster_id(mdto.getMem_id());
		String add = service.addselec(mdto.getMem_id());
		MemboardDto mlist = service.redlist(mbdto.getMb_seq());
		MemboardDto bopet = service.bopet(mbdto.getMb_seq());		
		String[] bopetarr = bopet.getMb_pet_name().split(",");
		String[] servicearr = mlist.getMb_service().split(",");
		String[] petnamearr = mlist.getMb_pet_name().split(",");
		List<String> pettype = new ArrayList<String>();
		List<String> services = new ArrayList<String>();
		for(String boptype : bopetarr) {
			pettype.add(service.getpettype(boptype));			
		}

		for(String petname : petnamearr) {
			pdto.setPet_name(petname);
			pdto.setMaster_id(mdto.getMem_id());
		}	
		if(mlist.getMb_petphoto() != null) {
			String[] photoarr = mlist.getMb_petphoto().split(",",-1);
			mlist.setPhoto(photoarr);
		}
		for(String service : servicearr) {services.add(service);}
		String[] stimearr = mlist.getMb_stime().split(":");
		String[] etimearr = mlist.getMb_etime().split(":");
		int stime = Integer.parseInt(stimearr[0]);
		int etime = Integer.parseInt(etimearr[0]);
		int timesub = stime - etime;
		String[]  alltimearr = Integer.toString(timesub).split("-");
		int alltime = Integer.parseInt(alltimearr[1]);
		m.addAttribute("petResult",petResult);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", mdto.getMem_id());
		m.addAttribute("alltime",alltime);
		return "mb_board/board";
	}

	@RequestMapping("modified")
	public String redlist_modified(Model m,String mb_seq) throws Exception {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		MemboardDto modlist = service.modlist(mb_seq);
		String[] petnamearr = modlist.getMb_pet_name().split(",");
		String[] servicearr = modlist.getMb_service().split(",");
		List<String> petnames = new ArrayList<>();
		List<String> services = new ArrayList<>();
		List<Mypet_regDTO> list = service.Petselect(mdto.getMem_id());
		List<MemboardDto> plist = service.petselname(mdto.getMem_id());
		List<String[]> petarr = new ArrayList<>();
		List<String> petname = new ArrayList<>();
		for(String service : servicearr) {
			services.add(service);
		}
		for(String pet : petnamearr) {
			petnames.add(pet);
		}		

		for(MemboardDto petlist : plist) {
			petarr.add(petlist.getMb_pet_name().split(","));
		}

		for(String[] PetNameList : petarr) {
			for(String PetNameArr : PetNameList) {
				petname.add(PetNameArr);
			}
		}

		List<String> petexc = new ArrayList<>();
		for(String petbod : petnames) {
			for(String petlib : petname) {
				if(!petlib.contentEquals(petbod)) {
					petexc.add(petlib);		
				}
			}
		}


		String add = service.addselec(modlist.getMb_writer());
		m.addAttribute("petexc",petexc);
		m.addAttribute("list", list);
		m.addAttribute("add", add);	
		m.addAttribute("modlist", modlist);	
		m.addAttribute("petnames", petnames);	
		m.addAttribute("services", services);

		return "mb_board/board_Modified";
	}

	@RequestMapping("modified_con")
	public String modified_con(MemboardDto mbdto,Model m) throws Exception {
		service.Memboardupdate(mbdto);	
		m.addAttribute("mb_seq", mbdto.getMb_seq());
		return "redirect:modfilist";
	}

	@RequestMapping("mb_board")
	public String mb_board(Model m,HttpServletRequest req) throws Exception {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		int cpage = 1;
		try {
			cpage= Integer.parseInt(req.getParameter("cpage"));
		} catch(Exception e) {}

		List<MemboardDto> mblist = service.mb_boardList(cpage);
		for(MemboardDto mb : mblist) {
			m.addAttribute("petname",mb.getMb_pet_name());
			if(mb.getMb_petphoto() != null) {
				String[] photoarr = mb.getMb_petphoto().split(",",-1);
				mb.setPhoto(photoarr);
			}
		}
		String navi = service.getPageNavi(cpage);
		m.addAttribute("id",mdto.getMem_id());
		m.addAttribute("navi", navi);
		m.addAttribute("mblist", mblist);
		return "mb_board/board_list";
	}

	@RequestMapping("deleteboard")
	public String deleteboard(MemboardDto mbdto) throws Exception {
		service.deleteboard(mbdto);
		return "redirect:mb_board";
	}

	

	
}

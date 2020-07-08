package kh.pet.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dto.MemberDTO;
import kh.pet.dto.PetDto;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.TotboardDTO;
import kh.pet.dto.WaitlistDTO;
import kh.pet.service.PetsitterService;
import kh.pet.service.PetsitterboardService;
import kh.pet.service.ReviewService;

@Controller
@RequestMapping("/board/")
public class PetsitterboardController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private PetsitterService psservice;
	@Autowired
	private PetsitterboardService psbservice;
	@Autowired
	private ReviewService rwservice;
	
	@RequestMapping("outputSingle")
	public String outputSingle(String psb_writer,String psb_seq,Model model,TotboardDTO totdto ) throws Exception{
		totdto = psbservice.selectBoard(psb_writer,psb_seq);
		model.addAttribute("tot_Info",totdto);
		return "petsitter_board/board/board_single_view";
	}
	
	@RequestMapping("outputList")
	public String outputList(HttpServletRequest req, Model model) throws Exception{
		int cpage=1;
		try {
			cpage= Integer.parseInt(req.getParameter("cpage"));
		} catch(Exception e) {}
		List<PetsitterboardDTO> list =psbservice.outputList(cpage); // �븳�럹�씠吏��뿉 異쒕젰�릺�뒗 寃뚯떆臾� list
		String pageNavi = psbservice.getPageNavi(cpage); //�꽕鍮꾨컮
		model.addAttribute("list",list);
		model.addAttribute("pageNavi",pageNavi);
		return "petsitter_board/board/board_list";
	}
	
	@RequestMapping("board_register")
	public String board_register(Model model, PetsitterDTO psdto) {
		model.addAttribute("petsitter_Info", psdto);
 		return "petsitter_board/board/board_register";
	}

	@RequestMapping("board_single_view")
	public String board_single_view(Model model,TotboardDTO totdto)throws Exception{
		model.addAttribute("tot_Info",totdto);
		List<PetDto> pet_list = psbservice.selectMypet(((MemberDTO)session.getAttribute("loginIfo")).getMem_id());
		model.addAttribute("pet_list",pet_list);
		return "petsitter_board/board/board_single_view";
	}
	
	@RequestMapping("output")
	public String output(Model model)throws Exception{
		String mem_id= ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
		System.out.println(mem_id);
		PetsitterDTO psdto = psservice.selectById(mem_id);
		model.addAttribute("petsitter_Info", psdto);
		return"petsitter_board/board/board_register";
	}
	
	@RequestMapping("insertProc")
	public String insertProc(HttpServletRequest req,TotboardDTO totdto, MultipartFile file, Model model)throws Exception {
		String realPath=session.getServletContext().getRealPath("upload");
		File tempFilepath = new File(realPath);
		if(!tempFilepath.exists()) {tempFilepath.mkdir();}
		UUID uuid = UUID.randomUUID();
		String thumb_oriName = file.getOriginalFilename();
		totdto.setPsb_thumb(uuid.toString()+"_"+thumb_oriName);
		String nextSeq = psbservice.selectNextSeq();
		totdto.setPsb_seq(nextSeq);
		psbservice.insert(totdto);
		model.addAttribute("tot_Info",totdto);
		model.addAttribute("psb_writer",totdto.getPsb_writer());
		model.addAttribute("psb_seq",totdto.getPsb_seq());
		file.transferTo(new File(realPath+"/"+totdto.getPsb_thumb()));
		return "redirect:outputSingle";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCnt", method=RequestMethod.POST)
	public int selectCnt (String psb_writer)throws Exception {
		return psbservice.selectCnt(psb_writer);
	}
	
	@RequestMapping("waitList")
	public void waitList(WaitlistDTO wdto)throws Exception{
//		System.out.println("seq:"+wdto.getBoard_seq());
//		System.out.println("id:"+((MemberDTO)session.getAttribute("loginInfo")).getMem_id());
//		System.out.println("pet:"+wdto.getPet_name());
//		System.out.println("petsitter:"+wdto.getPetsitter_id());
//		System.out.println("end:"+wdto.getRsv_end_day());
//		System.out.println("start:"+wdto.getRsv_start_day());
//		System.out.println("point:"+wdto.getRsv_point());
//		System.out.println("time:"+wdto.getPsb_time());
		String mem_id=((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
		wdto.setMem_id(mem_id);
	}
}

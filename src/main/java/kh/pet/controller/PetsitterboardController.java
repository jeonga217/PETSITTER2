package kh.pet.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dto.CurrentPickDTO;
import kh.pet.dto.CurrentReserveDTO;
import kh.pet.dto.MemberDTO;
import kh.pet.dto.Mypet_regDTO;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.TotboardDTO;
import kh.pet.dto.WaitlistDTO;
import kh.pet.filter.xssfilter;
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
	
//	@RequestMapping("outputSingle")
//	public String outputSingle(String psb_writer,String psb_seq,TotboardDTO totdto,Model model ) throws Exception{
//		//TotboardDTO totdto = psbservice.selectBoard(psb_writer,psb_seq);
//		List<CurrentReserveDTO> reserve_list = psbservice.selectCur_reserve(psb_seq);
//		List<Mypet_regDTO> pet_list = psbservice.selectMypet(((MemberDTO)session.getAttribute("loginInfo")).getMem_id());
//		model.addAttribute("reserve_list",reserve_list);
//		model.addAttribute("tot_Info",totdto);
//		model.addAttribute("pet_list",pet_list);
//		return "petsitter_board/board/board_single_view";
//	}
	
	@RequestMapping("outputList")
	public String outputList(HttpServletRequest req, Model model) throws Exception{
		int cpage=1;
		try {
			cpage= Integer.parseInt(req.getParameter("cpage"));
		} catch(Exception e) {}

		List<PetsitterboardDTO> list =psbservice.outputList(cpage);

		String pageNavi = psbservice.getPageNavi(cpage);
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
	public String board_single_view(String psb_writer,String psb_seq,Model model)throws Exception{
		System.out.println(":"+psb_writer);
		System.out.println(":"+psb_seq);
		TotboardDTO totdto = psbservice.selectBoard(psb_writer,psb_seq);
		List<CurrentReserveDTO> reserve_list = psbservice.selectCur_reserve(psb_seq);
		List<Mypet_regDTO> pet_list = psbservice.selectMypet(((MemberDTO)session.getAttribute("loginInfo")).getMem_id());
		String mem_id= ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
		int myPoint = psbservice.selectMyPoint(mem_id);
		model.addAttribute("myPoint",myPoint);
		model.addAttribute("tot_Info",totdto);
		model.addAttribute("reserve_list",reserve_list);
		model.addAttribute("pet_list",pet_list);
		return "petsitter_board/board/board_single_view";
	}

	@RequestMapping("board_single_update")
	public String board_single_update(String psb_writer,String psb_seq,Model model) throws Exception{
		TotboardDTO totdto = psbservice.selectBoard(psb_writer,psb_seq);
		model.addAttribute("tot_Info",totdto);
		return "petsitter_board/board/board_single_update";
	}
	
	@RequestMapping("output")
	public String output(Model model)throws Exception{
		String mem_id= ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
		PetsitterDTO psdto = psservice.selectById(mem_id);
		model.addAttribute("petsitter_Info", psdto);
		return "petsitter_board/board/board_register";
	}
	
	
	@RequestMapping("insertProc")
	public String insertProc(HttpServletRequest req,TotboardDTO totdto, MultipartFile file, Model model)throws Exception {
		xssfilter xss = new xssfilter();
		totdto.setPsb_title(xss.cleanXSS(totdto.getPsb_title()));
		totdto.setPsb_contents(xss.cleanXSS(totdto.getPsb_contents()));
		
		String realPath=session.getServletContext().getRealPath("upload");
		File tempFilepath = new File(realPath);
		if(!tempFilepath.exists()) {tempFilepath.mkdir();}
		UUID uuid = UUID.randomUUID();
		String thumb_oriName = file.getOriginalFilename();
		totdto.setPsb_thumb(uuid.toString()+"_"+thumb_oriName);
		
		String nextSeq = psbservice.selectNextSeq();
		totdto.setPsb_seq(nextSeq);
		psbservice.insert(totdto);
		
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(totdto.getPsb_start_day());
		
		long diff= (totdto.getPsb_end_day()).getTime() - (totdto.getPsb_start_day()).getTime();
		long date_diff = Math.abs(diff/(24*60*60*1000));
		
		ArrayList<Object> daylist = new ArrayList<Object>();
		
		for(int i=0;i<date_diff+1;i++) {
			HashMap<String, Object> day_list = new HashMap<String, Object>();
			if(i==0) {
				day_list.put("parent_board_seq",totdto.getPsb_seq());
				day_list.put("cur_date",(df.format(cal.getTime())));
			} else {
				day_list.put("parent_board_seq",totdto.getPsb_seq());
				cal.add(Calendar.DATE,1);
				day_list.put("cur_date",(df.format(cal.getTime()))); 
			}
			daylist.add(day_list);
		}
		psbservice.createTb(daylist);
//		model.addAttribute("totdto",totdto);
//		model.addAttribute("psb_writer",totdto.getPsb_writer());
//		model.addAttribute("psb_seq",totdto.getPsb_seq());
		file.transferTo(new File(realPath+"/"+totdto.getPsb_thumb()));
		return "redirect:outputList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCnt", method=RequestMethod.POST)
	public int selectCnt (String psb_writer)throws Exception {
		return psbservice.selectCnt(psb_writer);
	}
	
	//waitlist�� ���� �ø���
	@ResponseBody
	@RequestMapping(value="/waitList", method=RequestMethod.POST)
	public int waitList(WaitlistDTO wldto)throws Exception{
		return psbservice.insertwaitlist(wldto);
	}
	
	//�ش� �Խù��� ������ �ִ��� Ȯ��
	@ResponseBody
	@RequestMapping(value="/checkExistReservation", method=RequestMethod.POST)
	public int checkExistReservation (String psb_seq) throws Exception {
		return psbservice.checkExistReservation(psb_seq);
	}
	
	@RequestMapping("/deleteBoard")
	public String deleteBoard(String psb_seq) throws Exception{
		psbservice.deleteBoard(psb_seq);
		return "redirect:outputList";
	}
	
//	@RequestMapping("/updateBoard")
//	public String updateBoard(String psb_seq) throws Exception{
//		psbservice.updateBoard(psb_seq);
//		return "redirect:outputList";
//	}
	
	// �ǽð� ����Ʈ���� �����ֱ�
	@ResponseBody
	@RequestMapping(value="/selectPrice", method=RequestMethod.POST)
	public List<Integer> selectPrice(@RequestParam(value="timearr[]") List<String> timearr,@RequestParam(value="typearr[]")List<String> typearr) throws Exception{

		ArrayList<Object> list = new ArrayList<>();

		for(String time:timearr) {
			for(String type:typearr) {
				Map<String, String> info = new HashMap<String, String>();
				info.put("time",time);
				info.put("type",type);
				list.add(info);
			}
		}
	return psbservice.selectPrice(list);
	}
	
	//������� ��ư ������  reserve_seq�� �޾Ƽ� AJAX�� ��� â ����ֱ�
	@ResponseBody
	@RequestMapping("/cancelReserve")
	public int cancelReserve(String reserve_seq)throws Exception{
		return psbservice.cancelReserve(reserve_seq);
	}
	
	//������ ��¥�� ������ ��������  waitlist��  ��ϵǱ� �� Ȯ��
	@ResponseBody
	@RequestMapping(value="/checkAvailableReserve", method=RequestMethod.POST)
	public boolean checkAvailableReserve (CurrentPickDTO pickdto)throws Exception{
		boolean result = psbservice.checkAvailableReserve(pickdto);
		//System.out.println("��"+result);
		return result;
	}
	
	@RequestMapping("/board_confirmReserve")
	public String board_confirmReserve(Model model)throws Exception{
		String mem_id= ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
		WaitlistDTO wldto = psbservice.selectWaitlist(mem_id);
		model.addAttribute("waitlist",wldto);
		return "petsitter_board/board/board_confirmReserve";
	}

}

package kh.pet.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dto.CommentsDTO;
import kh.pet.dto.CommunityDTO;
import kh.pet.dto.CommunityListDTO;
import kh.pet.dto.MemberDTO;
import kh.pet.dto.ReportDTO;
import kh.pet.service.CommentsService;
import kh.pet.service.CommunityService;

@Controller
@RequestMapping("/community/")
public class CommunityController {

	@Autowired
	private HttpSession session;

	@Autowired
	private CommunityService cu_service;

	@Autowired
	private CommentsService cm_service;

	//게시글 작성 페이지
	@RequestMapping("write")
	public String write() {

		String id = ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();

		if(id.contentEquals("admin")) {
			return "community/write_Admin";
		} else {
			return "community/write_Member";	
		}
	}

	//게시글 작성
	@RequestMapping("writeProc")
	public void writeProc(CommunityDTO cu_dto, HttpServletResponse res)throws Exception {
		cu_dto.setCu_writer(((MemberDTO)session.getAttribute("loginInfo")).getMem_id());
		int result = cu_service.insert(cu_dto);
		res.sendRedirect("list");

	}

	//게시판 _ 목록 (페이징)
	@RequestMapping("list")
	public String list(Model model, Integer cpage)throws Exception{

		session.removeAttribute("view");

		if(cpage == null) {

			cpage = 1;
		}

		List<CommunityListDTO> list = cu_service.communityAll(cpage);
		String navi = cu_service.getPageNavi(cpage);
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		session.setAttribute("cpage", cpage);

		return "community/list";
	}

	//게시글 확인
	@RequestMapping("view")
	public String view(int cu_seq,int cu_view_cnt,Model model)throws Exception {

		CommunityListDTO view = cu_service.view(cu_seq, cu_view_cnt);
		session.setAttribute("view", view);

		List<CommentsDTO> cm_list = cm_service.commentsAll(cu_seq);
		model.addAttribute("cm_list", cm_list);
		return "community/view";
	}


	//게시물 수정 _ 페이지 이동
	@RequestMapping("update")
	public String update()throws Exception{

		return "community/update";
	}

	//게시물 수정 _ 실행
	@RequestMapping("updateProc")
	public void updateProc(CommunityDTO cu_dto,HttpServletResponse res)throws Exception {

		cu_service.updateProc(cu_dto);

		res.sendRedirect("/community/list");
	}

	//게시물 삭제
	@RequestMapping("delete")
	public void delete(int cu_seq, HttpServletResponse res) throws Exception{

		cu_service.delete(cu_seq);

		res.sendRedirect("/community/list");
	}


	//게시물 검색
	@RequestMapping("search")
	public String search(Model model, Integer cpage, String keyword, String search_option) throws Exception{

		session.removeAttribute("view");

		if(cpage == null) {

			cpage = 1;
		}

		List<CommunityListDTO> list = cu_service.search( cpage, keyword, search_option);
		String navi = cu_service.getSearchPageNavi(cpage, keyword, search_option);
		
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		session.setAttribute("cpage", cpage);
		
		return "community/list";
	}

	//댓글관련

	//댓글작성
	@RequestMapping("comments_insert")
	public void insert(CommentsDTO cm_dto,Model model)throws Exception {

		CommunityListDTO cu_dto = (CommunityListDTO)session.getAttribute("view");
		int cm_parent_seq = cu_dto.getCu_seq();
		String cm_writer = ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
		int result = cm_service.insert(cm_dto, cm_parent_seq, cm_writer);

		List<CommentsDTO> cm_list = cm_service.commentsAll(cm_parent_seq);
		model.addAttribute("cm_list", cm_list);

	}

	//댓글 수정
	@RequestMapping("comments_update")
	public void commentsUpdate(CommentsDTO cm_dto) throws Exception{

		cm_service.update(cm_dto);
	}
	
	//댓글 삭제
	@RequestMapping("comments_delete")
	public void commentsDelete(int cm_seq)throws Exception{
		
		cm_service.delete(cm_seq);
	}
	
	
	
	
	//파일 업로드
	@RequestMapping("fileUpload")
	public void fileUp(MultipartFile uploadFile,HttpServletResponse response) throws Exception{
		
	      String upload = session.getServletContext().getRealPath("uploadimage/");
	      File uploadPath = new File(upload);
	      
	      if(!uploadPath.exists()) {
	          uploadPath.mkdir();
	       }
	      
	      UUID uuid = UUID.randomUUID();
	      String sysName = uuid+"_"+uploadFile.getOriginalFilename();
	      File targetLoc = new File(uploadPath +"/"+sysName);
	      uploadFile.transferTo(targetLoc);
	      
	      System.out.println(sysName);
	      
	      JSONObject jobj = new JSONObject();
	      jobj.put("url", "/uploadimage/"+sysName);
	      response.getWriter().append(jobj.toString());
		
	}
	
	//신고기능
			@RequestMapping("report")
			public void report(ReportDTO r_dto){
				String report_id = ((MemberDTO)session.getAttribute("loginInfo")).getMem_id();
				r_dto.setReport_id(report_id);
				CommunityListDTO cu_dto = (CommunityListDTO)session.getAttribute("view");

				if(r_dto.getReport_target().contentEquals("")) {
					//게시글 신고 창 -- seq, target, id, reason 들어가 있음 나머지 채워서 db 넣기
					r_dto.setR_parent_seq(cu_dto.getCu_seq());
					r_dto.setReport_target(cu_dto.getCu_writer());
					r_dto.setReport_type(1);
					
				}
				else {
					//댓글 신고 창 -- seq, target, id, contents 들어가 있음 나머지 채워서 db 넣기
					r_dto.setReport_type(2);
				}
				

			}

}

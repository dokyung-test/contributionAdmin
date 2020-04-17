package admin.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import admin.model.OrganizationDto;
import admin.model.ProgramDto;
import admin.model.ProgramImageDto;
import admin.model.UserDto;
import admin.model.adminNoticeDto;
import admin.model.adminQandADto;
import admin.service.adminService;

@Controller
public class adminController {
	
	@Autowired
	adminService service;
	
	public void setService(adminService service) {
		this.service = service;
	}
	
	// Q&A 리스트
	@RequestMapping(value= "/adminQandA.do",method = RequestMethod.GET)
    public ModelAndView qAnda() {		
		ModelAndView mav = new ModelAndView();
		List<adminQandADto> list = service.QandAList();		
		mav.addObject("list",list);
		mav.setViewName("adminQandA");	
		return mav;   	
    }
	
	// Q&A 상세 글 보기
	@RequestMapping(value = "/adminQandAContent.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void QandAContent(HttpServletResponse resp, int num) throws Exception {
		adminQandADto list = service.QandAContent(num);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	// Q&A답변하기
	@RequestMapping(value = "/qANDaUpdate.do", method = RequestMethod.POST)
	public String updateUser(adminQandADto dto) {
		service.updateQandA(dto);
		return "redirect:/adminQandA.do";
	}

	/* 공지사항 리스트 */
	@RequestMapping(value="/adminNoticeList.do",method = RequestMethod.GET)
	public ModelAndView adminNotice() {
		ModelAndView mav = new ModelAndView();
		List<adminNoticeDto> list = service.adminNotice();		
		mav.addObject("list",list);
		mav.setViewName("Notice");	
		return mav;   
	}
	
	//공지사항 추가
	@RequestMapping(value="insertNotice.do",method = RequestMethod.POST)
	public String insertNotice(adminNoticeDto dto) {
		service.insertNotice(dto);
		return "redirect:/adminNoticeList.do";
	}
	
	//공지사항 삭제
	@RequestMapping(value="deleteNotice.do",method = RequestMethod.GET)
	public String deleteNotice(int notice_idx) {
		service.deleteNotice(notice_idx);
		return "redirect:/adminNoticeList.do";
	}
	
	// 공지사항 수정폼 가기
	@RequestMapping(value = "/updateNoticeForm.do", method = RequestMethod.POST)
	public void ContributionUpdate(HttpServletResponse resp, int num2) throws Exception {
		adminNoticeDto list = service.noticeContent(num2);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	//공지사항 수정
	@RequestMapping(value="update.do",method = RequestMethod.POST)
	public String updateNotice(adminNoticeDto notice_idx) {
		service.updateNotice(notice_idx);
		return "redirect:/adminNoticeList.do";
	}
	
	//프로그램 승인 리스트
	@RequestMapping(value="programList.do", method = RequestMethod.GET)
	public ModelAndView selectProgramList() {
		ModelAndView mav = new ModelAndView("programApproval");
		mav.addObject("programList", service.selectAllProgramList());
		return mav;
	}
	
	//프로그램 승인 신청 상세
	@RequestMapping(value = "showProgramContent.do", method = RequestMethod.GET)
	public ModelAndView showProgramContent(int program_id, String organization_id) {
		ModelAndView mav = new ModelAndView("showApproval");
		ProgramDto pro = service.getProgramInfo(program_id, organization_id);
		mav.addObject("requestProgram", pro);
		mav.addObject("typeValue", service.selectTypeValue(pro.getType_id()));
		List<ProgramImageDto> images = service.getProgramBanner(program_id, organization_id);
		mav.addObject("images", images);
		return mav;
	}
	
	//승인 취소
	@RequestMapping(value = "updateApprovalFlg.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateApprovalProgram(String organization_id, int program_id, int approval_flg) {
		return service.updateApprovalFlg(organization_id, program_id, approval_flg);
	}
	
	//개인회원 리스트 출력
		@RequestMapping(value = "memberListType.do", method = RequestMethod.GET)
		@ResponseBody
		public ModelAndView memeberTypeList(int type) {
			ModelAndView m = new ModelAndView("memberList");
			if(type == 1) {
				List<UserDto> u = service.userList();
				m.addObject("userList", u);
				System.out.println("u: "+u);
				System.out.println("m: "+m.getModel());
			}else {
				List<OrganizationDto> o = service.organizationList();
				m.addObject("memberList", o);
			}
			
			return m;
		}
	
	
}

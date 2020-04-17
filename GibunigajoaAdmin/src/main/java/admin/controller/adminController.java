package admin.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

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
	
}

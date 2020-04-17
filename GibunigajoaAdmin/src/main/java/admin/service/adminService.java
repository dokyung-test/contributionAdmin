package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.model.adminNoticeDto;
import admin.model.adminDao;
import admin.model.adminQandADto;


@Service
public class adminService {

	@Autowired
	adminDao dao;

	public void setDao(adminDao dao) {
		this.dao = dao;
	}
	
	//Q&A 리스트
	public List<adminQandADto> QandAList(){
		return dao.adminQandA();
	}
	
	//Q&A 상세글 보기
	public adminQandADto QandAContent(int board_idx){
		return dao.adminQandAContent(board_idx);
	}
	
	//Q&A 답변
	public int updateQandA(adminQandADto dto) {
		return dao.updateQandA(dto);
	}
		
	//공지사항 리스트
	public List<adminNoticeDto> adminNotice(){
		return dao.adminNotice();
	}
	
	//공지사항 추가
	public int insertNotice(adminNoticeDto dto) {
		return dao.insertNotice(dto);
	}
	
	//공지사항 삭제
	public int deleteNotice(int notice_idx) {
		return dao.deleteNotice(notice_idx);
	}
	
	//공지사항 상세글
	public adminNoticeDto noticeContent(int notice_idx) {
		return dao.adminNoticeContent(notice_idx);
	}
	
	//공지사항 수정
	public int updateNotice(adminNoticeDto notice_idx) {
		return dao.adminNoticeUpdate(notice_idx);
	}
	
}

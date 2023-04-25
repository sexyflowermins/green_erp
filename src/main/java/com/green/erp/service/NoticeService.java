package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.repository.NoticeRepository;
import com.green.erp.repository.model.Notice;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeRepository noticeRepository;
	
	public void createNotice(NoticeFormDto noticeFormDto) {
		
		int result = noticeRepository.insert(noticeFormDto);
		if(result != 1) {
			System.out.println("실패");
		}
	}
	
	public List<Notice> findAll() {
		List<Notice> noticeList = noticeRepository.findAll();
		if(noticeList == null) {
			System.out.println("실패");
		}
		
		return noticeList;
	}
}

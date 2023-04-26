package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.dto.NoticeUpdateFormDto;
import com.green.erp.repository.NoticeRepository;
import com.green.erp.repository.model.Notice;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;

	public void createNotice(NoticeFormDto noticeFormDto) {

		int result = noticeRepository.insert(noticeFormDto);
		if (result != 1) {
			System.out.println("실패");
		}
	}

	public List<Notice> findAll() {
		List<Notice> noticeList = noticeRepository.findAll();
		if (noticeList == null) {
			System.out.println("실패");
		}

		return noticeList;
	}
	
	public List<Notice> findWithName() {
		List<Notice> noticeList = noticeRepository.findWithName();
		if (noticeList == null) {
			System.out.println("실패");
		}

		return noticeList;
	}
	
	public List<Notice> findBySearch(String search) {
		List<Notice> noticeList = noticeRepository.findBySearch(search);
		if (noticeList == null) {
			System.out.println("실패");
		}

		return noticeList;
	}

	public Notice findById(int id) {

		Notice notice = noticeRepository.findById(id);
		if (notice == null) {
			System.out.println("실패");
		}

		return notice;
	}

	public int updateNotice(NoticeUpdateFormDto updateFormDto) {

		int resultRowCount = noticeRepository.updateByForm(updateFormDto);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}

	// 조회수 올리기 기능
	public int updateViews(int id) {
		int resultRowCount = noticeRepository.updateViews(id);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}

	public int deleteNotice(int id) {
		int resultRowCount = noticeRepository.deleteById(id);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}
}

package com.green.erp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.erp.dto.DepartmentCountDto;
import com.green.erp.dto.GradeCountDto;
import com.green.erp.dto.RatingDto;
import com.green.erp.dto.SalaryDto;
import com.green.erp.dto.SalaryHistoryDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Grade;
import com.green.erp.repository.model.Notice;
import com.green.erp.repository.model.SalaryHistory;
import com.green.erp.repository.model.WorkTime;
import com.green.erp.service.NoticeService;
import com.green.erp.service.adminService;
@Controller
@MultipartConfig
@RequestMapping("/admin")
public class adminController {

	@Autowired
	private adminService adminservice;
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("headerNoticeList")
	public List<Notice> getheaderNoticeList() {
		List<Notice> noticeList = noticeService.findWithNameOrderBy();
		return noticeList;
	}


	// 전체조회
	@GetMapping("/findAll")
	public String department(Model model) {

		List<Department> list = adminservice.findAllDepartment();
		model.addAttribute("list", list);
		return "/admin/adminPage";

	}
	// 선택조회
	@GetMapping("/findBydepartment")
	public String findByDepartment(@RequestParam String name, Model model) {
		List<Department> selectdepartmentlist = adminservice.findByDepartment(name);
		List<DepartmentCountDto> departmentList = adminservice.findByDepartment1();
		List<GradeCountDto> gradeCountDto = adminservice.gradeCount();
		model.addAttribute("gradeCountDto",gradeCountDto);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("selectdepartmentlist", selectdepartmentlist);
		return "/admin/adminPage";
	}
	//부서에 포함된 사원 찾기
	@GetMapping("/selectdepartment")
	public String selectDepartment(@RequestParam String name, Employees employees, Model model) {
		List<Department> selectdepartmentlist = adminservice.findByDepartment(name);
		List<Employees> employeeslist = adminservice.selectDepartment(employees);
		List<DepartmentCountDto> departmentList = adminservice.findByDepartment1();
		List<GradeCountDto> gradeCountDto = adminservice.gradeCount();
		model.addAttribute("gradeCountDto",gradeCountDto);
		model.addAttribute("selectdepartmentlist", selectdepartmentlist);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("employeeslist", employeeslist);
		return "/admin/adminPage";

	}
	// 사원정보 상세 페이지 이동
	@GetMapping("/privacy")
	public String selectByEmployeesId(@RequestParam Integer id, Model model) {
		Employees employees = adminservice.selectByEmplyees(id);
		List<Department> list = adminservice.findAllDepartment();
		List<Grade> listgrade = adminservice.serchGrade();
		List<SalaryDto> salaryList = adminservice.selectSalary();
		List<RatingDto> ratingList = adminservice.selectRating();
		model.addAttribute("listgrade", listgrade);
		model.addAttribute("list", list);
		model.addAttribute("employees", employees);
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("ratingList",ratingList);
		
		return "/admin/privacy";

	}
	// 사원정보 상세 페이지 수정
	@PostMapping("/updatefromadmin")
	public String updatefromadmin(Employees employees, SalaryHistoryDto salaryHistoryDto,HttpServletRequest request) {
		
		if (employees.getPassword() == null || employees.getPassword().isEmpty()) {
			throw new CustomRestfullException("비밀번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (employees.getName() == null || employees.getName().isEmpty()) {
			throw new CustomRestfullException("이름을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (employees.getEmail() == null || employees.getEmail().isEmpty()) {
			throw new CustomRestfullException("e-mail을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (employees.getAge() == null) {
			throw new CustomRestfullException("나이를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (employees.getAddress() == null || employees.getAddress().isEmpty()) {
			throw new CustomRestfullException("주소를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (employees.getHireDate() == null || employees.getHireDate().isEmpty()) {
			throw new CustomRestfullException("입사일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (employees.getResignDate() == null || employees.getResignDate().isEmpty()) {
			throw new CustomRestfullException("퇴사일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		adminservice.updateemployees(employees);
		return "/admin/adminPage";
	}
	//상세 페이지 모달 form
	
	//관리자 페이지 삭제
	@GetMapping("/deleteByEmployees")
	public String deleteEmployees(Integer id) {
		adminservice.deleteEmpoyees(id);
		return "/admin/adminPage";
	}
	@PostMapping("/insertSalary")
	public String insertSalary(SalaryHistoryDto salaryHistoryDto) {
		adminservice.insertSalaryHistory(salaryHistoryDto);
		
		return "/admin/adminPage";
	}
	@GetMapping("/workTimeDetail/{empId}")
    public String workTimeDetail(@PathVariable Integer empId, Model model) {
		List<WorkTime> workTimeDetail = adminservice.selectWorkTime(empId);
		
		List<DepartmentCountDto> departmentList = adminservice.findByDepartment1();
		List<GradeCountDto> gradeCountDto = adminservice.gradeCount();
		model.addAttribute("gradeCountDto",gradeCountDto);
		model.addAttribute("departmentList", departmentList);
		
        model.addAttribute("workTimeDetail", workTimeDetail);
        return "admin/adminPage";
    }
	
	@GetMapping("/salaryHistoryDetail/{id}")
	public String salaryHistoryDetail(@PathVariable Integer id, Model model) {
		List<SalaryHistory> salaryHistoryDetail = adminservice.selectSalaryHistory(id);
		model.addAttribute("salaryHistoryDetail", salaryHistoryDetail);
		return "/admin/salaryHistoryView";
	}
	
	@PostMapping("/updateImage")
	public String updateImage(Employees employees, Model model, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		// 파일 업로드 처리
		Part filePart = request.getPart("updateimage"); // form name - file
		
		// 스트림 준비
		InputStream fileContent = filePart.getInputStream();
		// 출력 스트림 준비 --> 내 서버 컴퓨터에 FIle 객체 만들어서 저장 할 계획
		OutputStream outputStream = null;
		
		try {
			// 랜덤한 문자열을 여기서 생성 
			UUID uuid = UUID.randomUUID();
			System.out.println("uuid : " + uuid);
			
			String fileName = uuid + "_" + filePart.getSubmittedFileName();
			
			
			File file = new File("C:\\Users\\GGG\\Desktop\\새 폴더",fileName);
			
			// 파일 출력 스트림 생성 
			outputStream = new FileOutputStream(file);
			// 입력 스트림에서 바이트 단위로 읽어 오면서 출력 스트림에 쓰기 
			byte[] buffer = new byte[1024];
			int length;
			employees.setUploadFileName(fileName);
			
			while( (length = fileContent.read(buffer)) != -1 ) {
				outputStream.write(buffer, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			fileContent.close();
			if(outputStream != null) {
				outputStream.flush();
				outputStream.close();
			}
		}
		adminservice.updateImage(employees);
		System.out.println(employees.toString());
		return "admin/adminPage";
	}
}

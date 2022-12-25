package com.swimlover.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.service.AdProductService;
import com.swimlover.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/product/*")
@Controller
public class AdProductController {

	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	// 업로드폴더 주입
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 상품등록페이지
	@GetMapping("/productInsert")
	public void productInsert(Model model) {
		
		// 1차 카테고리 목록
		List<CategoryVO> categoryList = adProductService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
	}
	
	// 1차 카테고리를 참조하는 2차 카테고리 목록
	@ResponseBody
	@GetMapping("/subCategoryList/{cate_code}")
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cate_code") Integer cate_code) {
		
		log.info("1차 카테고리 코드 : " + cate_code);
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.getSubCategoryList(cate_code), HttpStatus.OK);
		return entity;
	}
	
	// CKEditor에서 사용하는 파일업로드
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename(); // 클라에서 보낸 원본파일이름
			byte[] bytes = upload.getBytes(); // 업로드된 파일을 가르키는 byte 배열
			
			// CKEditor를 통하여 업로드되는 서버측의 폴더
			String uploadPath = "C:\\dorothydatabase\\upload\\ckeditor\\" + fileName;
			
			// 1) 출력스트림을 이용하여 업로드 작업 진행
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.flush();
			// out.close();
			
			// 2) 업로드된 파일정보를 CKEditor에 보내는 작업
			printWriter = res.getWriter();
			String fileUrl = "/upload/" + fileName; // ckeditor에서 사용할 경로
			
			// 파일정보를 json 포맷으로 준비 " 큰따옴표를 내용으로 코딩할 경우 \" 로 사용
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) {
				printWriter.close();
			}
		}
	}
	
	// 상품정보 저장
	@PostMapping("/productInsert")
	public String productInsert(ProductVO vo, RedirectAttributes rttr) {
		
		FileUtils.uploadFile(uploadPath, vo.getUploadFile());
		
		
		return "redirect:/";
	}
	
	
	
	
}

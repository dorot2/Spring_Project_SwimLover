package com.swimlover.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swimlover.domain.CategoryVO;
import com.swimlover.domain.ProductVO;
import com.swimlover.dto.Criteria;
import com.swimlover.dto.PageDTO;
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
		
		log.info("상품정보 : " + vo);
		
		String uploadDateFolderPath = FileUtils.getFoler();
		String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolderPath, vo.getUploadFile());
		
		vo.setPdt_img(saveImageName);
		vo.setPdt_img_folder(uploadDateFolderPath);
		
		adProductService.productInsert(vo);	
		
		rttr.addFlashAttribute("msg", "상품등록이 성공하였습니다.");
		return "redirect:/admin/product/productList";
	}
	
	// 상품목록(페이징, 검색추가)
	@GetMapping("/productList")
	public void productList(@ModelAttribute("cri") Criteria cri, Model model) {
		
		List<ProductVO> productList = adProductService.getProductList(cri);
		
		productList.forEach(vo -> {
			vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
		});
		
		model.addAttribute("productList", productList);
		
		int totalCount = adProductService.getProductTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
	}
	
	
	// 상품목록에서 이미지 보여주기
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		ResponseEntity<byte[]> entity = null;
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	// 상품수정 페이지
	@GetMapping("/productModify")
	public void modify(@RequestParam("cate_code_prt") Integer cate_code_prt, @RequestParam("cate_code")Integer cate_code,
						@RequestParam("pdt_num") Integer pdt_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		// 1) 1차 카테고리 목록작업
		List<CategoryVO> cateList = adProductService.getCategoryList();
		model.addAttribute("cateList", cateList);
		
		// 2) 2차 카테고리 목록
		List<CategoryVO> subCateList = adProductService.getSubCategoryList(cate_code_prt);
		model.addAttribute("subCateList",subCateList);
		
		// 3) 수정상품정보 읽어오기.
		ProductVO vo = adProductService.getProductByNum(pdt_num);
		vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
		model.addAttribute("productVO", vo);
	}
	
	// 상품수정하기
	@PostMapping("/productModify")
	public String productModify(ProductVO vo, Criteria cri,RedirectAttributes rttr) {
		
		// 이미지 변경 업로드
		if(!vo.getUploadFile().isEmpty()) {
			
			// 1) 기존이미지 삭제
			
			// 파라미터
			FileUtils.deleteFile(uploadPath, vo.getPdt_img_folder(), vo.getPdt_img());
			
			// 2) 새 상품이미지 업로드
			String uploadDateFolderPath = FileUtils.getFoler();
			String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolderPath, vo.getUploadFile());
			// 3) DB에 저장될 이미지 관련정보
			vo.setPdt_img(saveImageName); // DB에 저장될 업로드 파일명
			vo.setPdt_img_folder(uploadDateFolderPath); // 날짜폴더명
		}
		
		// 4) 상품수정
		adProductService.productModify(vo);
	
		rttr.addFlashAttribute("msg", "상품 정보가 수정되었습니다.");
		
		return "redirect:/admin/product/productList" + cri.getListLink();
	}
	
	// 상품 삭제하기
	@GetMapping("/productDelete")
	public String productDelete(@RequestParam("pdt_num") Integer pdt_num, Criteria cri, RedirectAttributes rttr) {
		
		adProductService.productDelete(pdt_num);
		
		rttr.addFlashAttribute("msg", "상품 정보가 삭제되었습니다.");
		
		return "redirect:/admin/product/productList" + cri.getListLink();
	}

}

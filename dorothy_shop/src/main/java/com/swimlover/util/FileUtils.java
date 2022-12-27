package com.swimlover.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

public class FileUtils {
	
	// 파일업로드 작업.
	public static String uploadFile(String uploadFolder, String uploadDateFolderPath, MultipartFile uploadFile) {
		
		String uploadFileName = ""; // 실제 업로드한 파일명
		
		// File 클래스 : 파일과 폴더 작업 목적
		File uploadPath = new File(uploadFolder, uploadDateFolderPath);
		
		// 폴더 존재여부
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		String uploadClientFileName = uploadFile.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		
		uploadFileName = uuid.toString() + "_" + uploadClientFileName;
		
		try {
			// 파일정보
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile); // 서버의 폴더에 파일복사(업로드)
			
			// Thumbnail 작업
			if(checkImageType(saveFile)) {
				
				// 출력스트림은 객체만 생성되어도 실제 경로에 파일이 생성되어 있다.
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				
				//생성된 파일크기
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}

		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return uploadFileName;
	}
	
		
	// 날짜폴더 생성 및 리턴
	public static String getFoler() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date); // "2022-12-23"
		
		return str.replace("-", File.separator);
		
	}
	
	// 일반파일 또는 이미지파일 구분
	private static boolean checkImageType(File saveFile) {
		
		boolean isImage = false;
		
		try {
			String contextType = Files.probeContentType(saveFile.toPath());
			
			isImage = contextType.startsWith("image");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return isImage;
	}
	
	// 상품이미지를 바이트배열로 읽어오는 작업
	public static ResponseEntity<byte[]> getFile(String uploadPath, String fileName) throws IOException {
		
		ResponseEntity<byte[]> entity = null;
		
		File file = new File(uploadPath, fileName);
		
		// 상품이미지가 존재하지 않을 경우
		if(!file.exists()) {
			return entity;
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		
		entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
		return entity;
	}
}

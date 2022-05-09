package com.peachblossom.util;

import java.io.File;
import java.io.FileOutputStream;
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

public class UploadFileUtils {
	
	// 파일업로드
	public static String uploadFile(String uploadFolder, MultipartFile multipartFile) throws Exception {
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		String uploadFileName = multipartFile.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() +"_"+ uploadFileName;
		
		try {
			File saveFile = new File(uploadPath, uploadFileName);
			multipartFile.transferTo(saveFile);
			
			if(checkImageType(saveFile)) {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}
		}catch(Exception e) {
				e.printStackTrace();
			}
		
		return uploadFileName;
	}
	
	public static ResponseEntity<byte[]> getFileByte(String uploadFolder, String uploadPath, String fileName) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		File file = new File(uploadFolder + "\\" + uploadPath + "\\" + fileName);
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return entity;
	}
	
	// 업로드파일 이미지파일 여부 체크
	private static boolean checkImageType(File saveFile) throws Exception {
		
		try {
			String contentType = Files.probeContentType(saveFile.toPath());
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 업로드 폴더명 생성 (날짜이용)
	public static String getFolder() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//원본이미지, 썸네일이미지 삭제작업
	public static void deleteFile(String uploadFolder, String uploadPath, String fileName) throws Exception {
		new File(uploadFolder+ "\\"+ uploadPath.replace('/', File.separatorChar), fileName).delete();
		new File(uploadFolder+"\\"+"s_"+uploadPath.replace('/', File.separatorChar), fileName).delete();
	}
}

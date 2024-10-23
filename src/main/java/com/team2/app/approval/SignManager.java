package com.team2.app.approval;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SignManager {
	
	public String fileSave (String path, SignVO signVO) throws Exception {
		
		//저장 경로
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		//저장할 파일명 생성
		String fileName = UUID.randomUUID().toString();
		fileName = signVO.getSignTitle() + "_" + fileName + ".png";
		File file = new File(dir, fileName);
			
		
		// Base64 헤더 제거
		String base64Image = signVO.getSignImage();
		// base64Image.replace("data:image/png;base64", "");
			// * 수정한 이유
			// replace() 메서드는 매개변수 두개를 받아서 (A, B) A 문자열을 B로 바꿔주는 방식이다
			// 즉 문자열을 정확히 명시하여 핀포인트로 쳐내는 것인데
			// 문자열이 한글자라도 정확하지 않으면 동작하지 않기 때문에
			// 확장자가 png가 아닌 jpg나 gif와 같은 이미지를 받아온다면 작동을 안한다는 문제가 생겼다
			// 이를 위해 signaturepad.jsp의 자바스크립트에서 
			// const imgURL = signaturePad.toDataURL('image/png');
			// 로 정확히 png로 명시해주긴 했지만 뭐 아무튼 다른 곳에서도 이 클래스를 사용할 수도 있는거고...
		
		// 그러니 걍 if문 처리해주겠다
        if (base64Image.startsWith("data:image")) {
            base64Image = base64Image.substring(base64Image.indexOf(",") + 1);
        }
        
        // Base64 이미지 파일로 다시 디코딩
        byte[] image = Base64.getDecoder().decode(base64Image);
		
        // 이미지 저장
		try (FileOutputStream fos = new FileOutputStream(file)) {
			fos.write(image);
		}
			// 여기서 try문을 사용하는 이유
			// 정확히는 try-with-resources문이라고 한다
			// 코드 블록이 끝날 때 자동으로 자원을 해제해 줌
			// fos.close(); 이렇게 직접 닫아주지 않아도 되기 때문에 까먹고 실수할 일이 적어짐
			// 또한 exception 발생시 자동 예외 처리
			// 와 혜자
		
		
		log.info("저장 경로 : " + file.getAbsolutePath());
		log.info("저장 파일 이름 : " + fileName);
		
		
		
		return fileName;
	}
	
	
}

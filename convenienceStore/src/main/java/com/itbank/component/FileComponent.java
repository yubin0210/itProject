package com.itbank.component;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileComponent {

	private String saveDirectory = "C:\\upload";
	
	public FileComponent() {
		File f = new File(saveDirectory);
		if(f.exists() == false) {
			f.mkdirs();
		}
	}
	
	public String upload(MultipartFile f) {
		String ori = f.getOriginalFilename();
		String image = UUID.randomUUID().toString().replace("-", "");
		String ext = ori.substring(ori.lastIndexOf("."));
		image += ext;
		
		File dest = new File(saveDirectory, image);
		try {
			f.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return image;
	}
	
}

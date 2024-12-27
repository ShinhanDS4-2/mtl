package kr.co.mtl.upload;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mtl.s3.S3Service;

@Controller
public class FileUploadController {
	
	
	@Autowired
	private S3Service s3Service;
	
	@Autowired
    private ImageService imageService;
	
	@GetMapping("/upload")
	public String uploadForm() {
		return "common/file-upload";
	}
	
	@PostMapping("/upload")
	public String handleFileUpload(@RequestParam("file") MultipartFile[] files,@RequestParam Map<String,String> params, Model model) {
		
		List<String> messages=new ArrayList<>();
		
		try {
			
			String type = params.get("type");
	        String name = params.get("name");
	        String area = params.get("area");
	        String address = params.get("address");
	        Double latitude = Double.valueOf(params.get("latitude"));
	        Double hardness = Double.valueOf(params.get("hardness"));
	        String description = params.get("description");
	        String addressSi = params.get("addressSi");
	        String addressDong = params.get("addressDong");
			
			for(MultipartFile file:files) {
				
				String filePath="LOCATION/"+params.get("type")+"/"+file.getOriginalFilename();
				String s3Url=s3Service.uploadFile(file, filePath);
				
				imageService.saveLocationInfo(new HashMap<>(params));
				
				Map<String,Object> imageInfo=new HashMap<>();
				
				imageInfo.put("url",s3Url);
				imageInfo.put("origin_filename",file.getOriginalFilename());
				imageInfo.put("thumbnail_yn", "N");
				imageInfo.put("type","P");
				imageService.saveImageInfo(imageInfo);
				
				
				messages.add("사진 저장 성공! URL: "+s3Url);
				System.out.println("저장한 사진 URL: "+s3Url);
				System.out.println("사진 저장 성공!!! "+file.getOriginalFilename());
			}
			
		}catch(IOException e) {
			messages.add("Failed to upload file: "+e.getMessage());
			System.out.println("사진 저장 실패 ㅡㅡ");
			e.printStackTrace();
		}
		
		model.addAttribute("messages",messages);
		return "redirect:/uploadResult";
	}
}

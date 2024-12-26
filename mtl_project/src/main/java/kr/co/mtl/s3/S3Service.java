package kr.co.mtl.s3;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class S3Service {

	@Autowired
    private S3Client s3Client;

	@Value("${aws.s3.bucket}")
	private String BUCKET;
	
	/**
	 * 파일 업로드
	 * @param mFile
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	public String uploadFile(MultipartFile mFile,String filePath) throws IOException{
		
			InputStream inputStream = mFile.getInputStream();
			
			PutObjectRequest putObjectRequest=PutObjectRequest.builder()
					.bucket(BUCKET)
					.key(filePath)
					.build();
			
			s3Client.putObject(putObjectRequest,software.amazon.awssdk.core.sync.RequestBody.fromInputStream(inputStream, mFile.getSize()));
			
			return "File uploaded successfully to s3 bucket: "+BUCKET+" with filename: " + mFile.getOriginalFilename();
	}
}

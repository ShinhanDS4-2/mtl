package kr.co.mtl.s3;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class S3Service {

	@Autowired
    private S3Client s3Client;

	@Value("${aws.s3.bucket}")
	private String BUCKET;
	
	@Value("${aws.s3.region}")
	private String region;
	

	public String uploadFile(MultipartFile mFile,String filePath) throws IOException{
	  
	  PutObjectRequest putObjectRequest=PutObjectRequest.builder() 
			  .bucket(BUCKET)
			  .key(filePath) .build();
	  
	  s3Client.putObject(putObjectRequest,RequestBody.fromInputStream(mFile.getInputStream(), mFile.getSize()));
	  
	  // S3 객체 URL 반환
      return String.format("https://%s.s3.%s.amazonaws.com/%s", BUCKET, region, filePath);
	}
	 
}

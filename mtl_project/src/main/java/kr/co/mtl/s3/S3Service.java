package kr.co.mtl.s3;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class S3Service {

	@Autowired
    private S3Client s3Client;

	@Value("${aws.s3.bucket}")
	private String BUCKET;
	
	@Value("${aws.s3.region}")
	private String REGION;
	
	/**
	 * 이미지 업로드
	 * @param mFile
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public String uploadFile(MultipartFile mFile,String filePath) throws IOException {
	  
	  PutObjectRequest putObjectRequest = PutObjectRequest.builder() 
			  .bucket(BUCKET)
			  .key(filePath) .build();
	  
	  s3Client.putObject(putObjectRequest,RequestBody.fromInputStream(mFile.getInputStream(), mFile.getSize()));
	  
	  // S3 객체 URL 반환
      return String.format("https://%s.s3.%s.amazonaws.com/%s", BUCKET, REGION, filePath);
	}
	
	/**
	 * 이미지 삭제
	 * @param filePath
	 * @throws Exception
	 */
	public void deleteFile(String filePath) throws Exception {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(BUCKET)
                .key(filePath)
                .build();

        s3Client.deleteObject(deleteObjectRequest);
	}
	
	//파일 추출
	public String extractFilePathFromUrl(String url) {
		
		String bucketUrlPrefix = String.format("https://%s.s3.%s.amazonaws.com/", BUCKET, REGION);
	    if (url.startsWith(bucketUrlPrefix)) {
	        return url.substring(bucketUrlPrefix.length());
	    }
	    
	    return null;
	}
}

package kr.co.mtl.s3;

import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Response;

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
	public String uploadFile(MultipartFile mFile, String filePath) throws Exception {
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket(BUCKET)
                .key(mFile.getOriginalFilename())
                .build();

        S3Response response = s3Client.putObject(putObjectRequest, Paths.get(filePath));
        
        return response.toString();
	}
}

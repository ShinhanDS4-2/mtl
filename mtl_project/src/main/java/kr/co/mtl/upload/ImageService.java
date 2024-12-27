package kr.co.mtl.upload;

import java.util.Map;

public interface ImageService {
	
	void saveLocationInfo(Map<String,Object> locationInfo);
	void saveImageInfo(Map<String,Object> imageInfo);

}

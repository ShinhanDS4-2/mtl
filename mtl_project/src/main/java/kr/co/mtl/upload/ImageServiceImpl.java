package kr.co.mtl.upload;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageServiceImpl implements ImageService{

	@Autowired
    private ImageMapper imageMapper;

	@Override
	public void saveLocationInfo(Map<String,Object> locationInfo) {
		
        imageMapper.insertLocationInfo(locationInfo);
		
	}

	@Override
	public void saveImageInfo(Map<String, Object> imageInfo) {
		
		imageMapper.insertImageInfo(imageInfo);
	}
	
}

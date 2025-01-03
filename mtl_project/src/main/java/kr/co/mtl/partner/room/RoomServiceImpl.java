package kr.co.mtl.partner.room;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mtl.s3.S3Service;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomMapper roomMapper;
	
	@Autowired
	private S3Service s3service;
	
	//조회
	@Override
	public List<Map<String, Object>> getRoomList(int partner_idx) {
			
		return roomMapper.getRoomList(partner_idx);
	}
	
	//객실 등록
	@Override
	public void roomRegister(Map<String, Object> param, List<String> option, List<MultipartFile> images) throws IOException {
		
		roomMapper.roomRegister(param);
		int roomIdx = roomMapper.getIdx();
		
		for(String opt:option) {
			System.out.println("serviceImpl 시---작 : room_idx = "+roomIdx+" option = "+option + " opt = "+opt);
			roomMapper.roomFacilitiesRegister(roomIdx, opt);
		}
		
		boolean isThumbnail=true;
		
		for(MultipartFile image:images) {
			if(!image.isEmpty()) {
				
				String fileName=image.getOriginalFilename();
				String filePath="partner/"+roomIdx+"/"+fileName;
				String imageUrl=s3service.uploadFile(image, filePath);
						
				roomMapper.saveImageInfo(roomIdx,"P",imageUrl,isThumbnail ? "Y":"N",fileName);
				isThumbnail=false;
			}
		}
	}
	
	//객실 상세
	@Override
	public Room getRoomDetail(int room_idx) {
		
		return roomMapper.getRoomDetail(room_idx);
	}
	
	
	//객실 수정
	@Override
	public void roomUpdate(Map<String, Object> param, List<String> option, List<MultipartFile> images) throws IOException {

		
		roomMapper.roomUpdate(param);
		
		int room_idx = Integer.parseInt((String)param.get("room_idx")) ;
		System.out.println("업데이트에서 room_idx 가져오니? = "+room_idx);
		
		
	}


	

	

}

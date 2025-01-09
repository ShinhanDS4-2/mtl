package kr.co.mtl.partner.login;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerLoginMapper {

	// 사용자 정보 가져오기
	public Map<String, Object> getUserInfo(Map<String, Object> param);
	
	// 사용자 인증 정보 확인  //이거 추가
	public Map<String, Object> getUserCheck(Map<String, Object> param);
	
	// 사용자 정보 저장 (회원가입)
    public void insertUser(Map<String, Object> param);
    
    // 이메일 중복 체크 (회원가입)
    int checkEmailDuplication(String email);
    
    // 마이페이지 회원 정보 수정
    int updateUser(Map<String, Object> param);
    
    // 마이페이지 비밀번호 변경
    int updatePassword(Map<String, Object> param);
    
    // 마이페이지 현재 비밀번호 비교 확인
    Map<String, Object> getPasswordCheck(Map<String, Object> param);
    
    // 마이페이지 업체 정보 수정
    int updateBusiness(Map<String, Object> param);
    
    // 판매자 정보 가져오기 list admin 사용자 관리에서 사용
    List<Map<String, Object>> getAllPartner(Map<String, Object> param);

    // 판매자 정보 가져오기 list  개수
    int getAllPartnerCnt(Map<String, Object> param);
    
    // 판매자 정보 가져오기2 admin 사용자 관리에서 사용 views/admin/user/partnerDetail.jsp에서 사용
    Map<String, Object> getPartnerDetail(Map<String, Object> param);
    
    // 판매자 상태 승인
    int updateApprovalStatus(Map<String, Object> param);
}
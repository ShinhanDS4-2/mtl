package kr.co.mtl.upload;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ImageMapper {

    void insertLocationInfo(Map<String, Object> locationInfo);
    void insertImageInfo(Map<String,Object> imageInfo);
}
package kr.co.mtl.map;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MapService {

	@Value("${naver.map.client.key}")
	private String CLIENT_KEY;

	@Value("${naver.map.secret.key}")
	private String SECRET_KEY;
	
	public Map<String, Object> getGeoInfo(Map<String, Object> param) {
		
		String address = (String) param.get("address");
		String apiUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + URLEncoder.encode(address, StandardCharsets.UTF_8);

        try {
        	URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", CLIENT_KEY);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", SECRET_KEY);
            
            int responseCode = conn.getResponseCode();
            
            if (responseCode == 200) { 
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                
                String line = "";
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                
                in.close();
                
                // JSON 응답 처리 
                JSONParser parser = new JSONParser();
                JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
                JSONArray addresses = (JSONArray) jsonObj.get("addresses");
                JSONObject addressesObj = (JSONObject) addresses.get(0);
                
                param.put("latitude", addressesObj.get("y"));
                param.put("hardness", addressesObj.get("x"));
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return param;
	}
}

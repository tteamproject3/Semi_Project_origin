package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.DBdataService;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.tourVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

import java.io.InputStreamReader;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.io.BufferedReader;

import org.json.simple.JSONArray;

import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@RestController
@RequestMapping("/DBdata")
public class DBdataController {
	@Inject
	DBdataService service;
	ModelAndView mav = null;

	@GetMapping("/dataInsert")
	public String allowBasic() throws JsonMappingException, JsonProcessingException {
		try {
			/*-----------------데이터베이스에서 기존데이터 삭제----------------*/
			service.deleteFDB();
			service.deleteTDB();
			/*-----------------데이터베이스의 AUTO_INCREMENT값 초기화----------------*/
			service.updateFDB();
			service.updateTDB();
			/*-----------------축제 정보 API에서 가져와서 데이터베이스에 넣기----------------*/
			StringBuffer result = new StringBuffer(); // 결과값을 보여주는 result 를 try catch문 밖에서 선언
			try {
				StringBuilder urlBuilder = new StringBuilder(
						"http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api"); /* API URL */
				urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
						+ "=k%2BXUC8ZGTgciDc7GQP6q9XAd2Bd9IX5sbFqouotvyi4IQP2S%2BHFsLpGOxgYjnAlGImd%2FeNjPFPBu8xlS%2BhCLKw%3D%3D&pageNo=1"); /*
																																				 * Service
																																				 * Key
																																				 * +
																																				 * pageNO
																																				 */
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
						+ URLEncoder.encode("2000", "UTF-8")); /* 한 페이지 결과 수 */
				urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
						+ URLEncoder.encode("json", "UTF-8")); /* XML/JSON 여부 무조건 소문자로 */
				URL url = new URL(urlBuilder.toString()); // 주소완성
				/*---------------------------여기부터 API 서버연결 --------------------------------*/
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				BufferedReader rd;
				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}
				String line;
				while ((line = rd.readLine()) != null) {
					result.append(line);
				}
				conn.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
			/* ---------------------여기부터 받아온 json데이터 수정 --------------------------------- */
			String resultString = result.substring(0);/* StringBuffer 타입으로 받아온 result를 String으로 변환 */
			// {response={header={resultCode=00, resultMsg=NORMAL_SERVICE, type=json},
			// body={items=[{fstvlNm=상효원수목원 봄꽃축제, opar=상효원수목원, ~~
			// json데이터가
			// response안에 header(String)와 body(object)가 존재하고, body안쪽에 items배열이 있는 구조이기에 바로
			// 데이터를 뽑아서 쓸수는 없었다
			// 그래서 josn을 parsing하는데 Gson과 json-simple 라이브러리를 사용할 수 있었다.
			// 여기서는 json-simple 사용
			JSONParser parse = new JSONParser();
			JSONObject obj;
			try {
				obj = (JSONObject) parse.parse(resultString);
				JSONObject parse_response = (JSONObject) obj.get("response");
				JSONObject parse_body = (JSONObject) parse_response.get("body");
				// parsing 해서 item에 대한 object만 꺼내와서 JSONArray타입으로 정의
				JSONArray parse_items = (JSONArray) parse_body.get("items");

				// 데이터를 담아서 DB에 넣을 VO정의
				FestivalVO fVO = new FestivalVO();
				for (int i = 0; i < parse_items.size(); i++) { // 배열의 길이만큼 반복
					JSONObject imsi = (JSONObject) parse_items.get(i);
					fVO.setFestival_id((String) imsi.get("fstvlNm"));
					fVO.setFestival_place((String) imsi.get("opar"));
					fVO.setFestival_start_date((String) imsi.get("fstvlStartDate"));
					fVO.setFestival_end_date((String) imsi.get("fstvlEndDate"));
					fVO.setFestival_content((String) imsi.get("fstvlCo"));
					fVO.setFestival_phonenum((String) imsi.get("phoneNumber"));
					fVO.setFestival_site((String) imsi.get("homepageUrl"));
					fVO.setFestival_road_name_addr((String) imsi.get("rdnmadr"));
					fVO.setFestival_lotnum_addr((String) imsi.get("lnmadr"));
					fVO.setFestival_lat((String) imsi.get("latitude"));
					fVO.setFestival_long((String) imsi.get("longitude"));
					// System.out.println(fVO.toString());
					service.inputdata(fVO);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			// parsing외에도
			// result를 String타입으로 변경하고 HashMap타입으로 변환해서 출력하거나
			// result를 items~)))까지 잘라서 배열로 만들고 VO에 넣어서 DB에 넣어도 될듯함
			// 혹은 JSON자체를 편집하지않고 그대로 DB에 넣는 방법도 있는 것 같음
//      HashMap<String,Object> jsonMap = new ObjectMapper().readValue(resultString, HashMap.class);
//	        Iterator<Entry<String, Object>> it = jsonMap.entrySet().iterator();
//	        HashMap<String,Object> ha = new HashMap<String,Object>();
//	        String ha2 ="";
//	        while(it.hasNext()) {
//	        	Entry<String, Object> entrySet = (Entry<String, Object>) it.next();
//	        	System.out.println(entrySet.getKey() + " : " + entrySet.getValue());
//	        	ha2 = entrySet.getValue().toString();   
//	        }
			/*-----------------관광지 정보 API에서 가져와서 데이터베이스에 넣기----------------*/
			StringBuffer result1 = new StringBuffer(); // 결과값을 보여주는 result 를 try catch문 밖에서 선언
			try {
				StringBuilder urlBuilder = new StringBuilder(
						"http://api.data.go.kr/openapi/tn_pubr_public_trrsrt_api"); /* API URL */
				urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
						+ "=k%2BXUC8ZGTgciDc7GQP6q9XAd2Bd9IX5sbFqouotvyi4IQP2S%2BHFsLpGOxgYjnAlGImd%2FeNjPFPBu8xlS%2BhCLKw%3D%3D&pageNo=1"); /*
																																				 * Service
																																				 * Key
																																				 * +
																																				 * pageNO
																																				 */
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
						+ URLEncoder.encode("900", "UTF-8")); /* 한 페이지 결과 수 */
				urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
						+ URLEncoder.encode("json", "UTF-8")); /* XML/JSON 여부 무조건 소문자로 */
				URL url = new URL(urlBuilder.toString()); // 주소완성
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				BufferedReader rd;
				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}
				String line;
				while ((line = rd.readLine()) != null) {
					result1.append(line);
				}
				conn.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
			String resultString1 = result1.substring(0);
			JSONParser parse1 = new JSONParser();
			JSONObject obj1;
			try {
				obj1 = (JSONObject) parse1.parse(resultString1);
				JSONObject parse_response1 = (JSONObject) obj1.get("response");
				JSONObject parse_body1 = (JSONObject) parse_response1.get("body");
				JSONArray parse_items1 = (JSONArray) parse_body1.get("items");
				tourVO tVO = new tourVO();
				for (int i = 0; i < parse_items1.size(); i++) { // 배열의 길이만큼 반복
					JSONObject imsi = (JSONObject) parse_items1.get(i);
					tVO.setTour_id((String) imsi.get("trrsrtNm"));
					tVO.setTour_content((String) imsi.get("trrsrtIntrcn"));
					tVO.setTour_parkinglot_num((String) imsi.get("prkplceCo"));
					tVO.setTour_phonenum((String) imsi.get("phoneNumber"));
					tVO.setTour_road_name_addr((String) imsi.get("rdnmadr"));
					tVO.setTour_lotnum_addr((String) imsi.get("lnmadr"));
					tVO.setTour_lat((String) imsi.get("latitude"));
					tVO.setTour_long((String) imsi.get("longitude"));
					// getImgUrl((String)imsi.get("trrsrtNm"));
					// tVO.setTour_img(getImgUrl((String)imsi.get("trrsrtNm")));
					// System.out.println(tVO.toString());
					service.inputdataT(tVO);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}

	@GetMapping("/getImgUrl")
	//public String getImgUrl(String name) {
	public String getImgUrl(@RequestParam("name") String name) {
		//String name = a;
		StringBuffer result1 = new StringBuffer();
		String nameRp3 = name.replaceAll("\\s", "");
		String nameRp2 = nameRp3.replaceAll("\\(", "");
		String nameRp = nameRp2.replaceAll("\\)", "");
		System.out.println(nameRp);
		String a = null;
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"https://www.googleapis.com/customsearch/v1?key=AIzaSyDwSEWBBCWNZzbZ6_ItQYHifWBj_gVVgWQ&cx=5567bebaa39db4f79&q="
							+ nameRp);
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String line;
			while ((line = rd.readLine()) != null) {
				result1.append(line);
			}
			conn.disconnect();

		} catch (Exception e) {
		}
		String resultString = result1.substring(0);

		JSONParser parse1 = new JSONParser();
		JSONObject obj1;
		int i = 0;
		JSONArray parse3 = new JSONArray();
		JSONObject parse2 = new JSONObject();
		JSONObject parse_body1 = new JSONObject();
		try {
			do {
				do {
					obj1 = (JSONObject) parse1.parse(resultString);
					//System.out.println("01" + obj1);
					JSONArray parse_items1 = (JSONArray) obj1.get("items");
					//System.out.println("1" + parse_items1);
					parse_body1 = (JSONObject) parse_items1.get(i);
					//System.out.println("2" + parse_body1);
					if (parse_body1.get("pagemap") == null) {
						i++;
					}
				} while (parse_body1.get("pagemap") == null);
				parse2 = (JSONObject) parse_body1.get("pagemap");
				//System.out.println("3" + parse2);
				if (parse2.get("cse_image") == null) {
					i++;
				}
			} while (parse2.get("cse_image") == null);
			parse3 = (JSONArray) parse2.get("cse_image");
			//System.out.println("4" + parse3);
			JSONObject parse4 = (JSONObject) parse3.get(0);
			//System.out.println("5" + parse4);
			//System.out.println("6" + parse4.get("src"));
			a = parse4.get("src").toString();
			//System.out.println(i);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return a;
	}
	
	@GetMapping("/gmapGo")
	public List<tourVO> gmapGo() {
		return service.GmapGo();
	}
	
	@GetMapping("/getPdata")
	public List<tourVO> getPdata(@RequestParam("num") String num) {
		System.out.println(num);
		List<tourVO> TVO = service.getPdata(Integer.parseInt(num));
		TVO.get(0).setTour_img(getImgUrl(TVO.get(0).getTour_id()));
		System.out.println(TVO.toString());
		//TVO.get(0).getTour_id();
		//getImgUrl(TVO.get(0).getTour_id());
		
		return TVO;
	}
}

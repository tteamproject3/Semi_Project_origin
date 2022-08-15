package com.campus.myapp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.FestivalService;
import com.campus.myapp.service.PostService;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.PagingVO;

@Controller
public class HomeController {
	
	@Inject
	PostService p_service;
	
	@Inject
	FestivalService f_service;
	
	ModelAndView mav = null;
	
	@RequestMapping("/")
	public ModelAndView home() {
		
		mav = new ModelAndView();
		
		//불러올 테마 레코드 세팅
		PagingVO pVO = new PagingVO();
		pVO.setOnePageRecord(4);
		pVO.setOffsetPoint(0);
		mav.addObject("t_list", p_service.getThemeList(pVO));
		
		//축제데이터 불러오기
		//System.out.println(f_service.getFestivalList().toString());
		
		
		List<FestivalVO> fList = f_service.getFestivalList();
		for(FestivalVO fvo:fList) {
			insertUrl(fvo);
		}
		
		mav.addObject("f_list", fList);
		mav.setViewName("index");
		return mav;
	}
	
	//축제vo에 url 넣기
	public void insertUrl(FestivalVO fVO) {
		String name = fVO.getFestival_id();
		String url = getImgUrl(name);
		//System.out.println(url);	
		fVO.setFestivalcol(url);
//		return fVO;
	}
	
	public String getImgUrl(String name) {
		//String name = a;
		StringBuffer result1 = new StringBuffer();
		String nameRp3 = name.replaceAll("\\s", "");
		String nameRp2 = nameRp3.replaceAll("\\(", "");
		String nameRp = nameRp2.replaceAll("\\)", "");
		//System.out.println(nameRp);
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
		String[] strArr = {};
		try {
			do{
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
//			System.out.println("4" + parse3);
			JSONObject parse4 = (JSONObject) parse3.get(0);
//			System.out.println("5" + parse4);
//			System.out.println("6" + parse4.get("src"));
			a = parse4.get("src").toString();
			strArr = a.split("[.]");
//			System.out.println("asdasdasdasasdasasdasdas");
//			System.out.println("123"+Arrays.toString(strArr));
//			System.out.println("11"+strArr[0]);
//			System.out.println(strArr[0]);
//			System.out.println(i);
//			System.out.println(strArr[0]);
//			System.out.println(strArr[0]);
//			System.out.println(strArr[0].toString().equals("https://blogthumb"));
//			System.out.println(!strArr[0].toString().equals("https://blogthumb"));
			if (strArr[0].toString().equals("https://blogthumb") || strArr[0].toString().equals("https://scontent-atl3-1")) {
				i++;
				//System.out.println(i);
			}
			}while(strArr[0].toString().equals("https://blogthumb") || strArr[0].toString().equals("https://scontent-atl3-1"));
			//System.out.println(i);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return a;
	}

	@RequestMapping("/home/term")
	public String term() {
		return "home/term";
	}
	
	@RequestMapping("/home/aboutus")
	public String aboutus() {
		return "home/aboutus";
	}
	@RequestMapping("/home/policy")
	public String policy() {
		return "home/policy";
	}
}

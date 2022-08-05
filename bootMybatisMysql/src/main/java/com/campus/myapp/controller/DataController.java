package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.DataService;
import com.campus.myapp.vo.DataVO;
import com.mysql.cj.Session;

@RestController
@RequestMapping("/data/*")
public class DataController {
	@Inject
	DataService service;

	ModelAndView mav = null;

	// 자료실 목록
	@GetMapping("dataList")
	public ModelAndView dataList() {
		mav = new ModelAndView();

		// DB전체조회
		// Object a = service.dataAllSelect();
		mav.addObject("dataList", service.dataAllSelect());
		mav.setViewName("data/dataList");
		return mav;
	}

	// 자료실 글 등록 폼
	@GetMapping
	public ModelAndView dataWrite() {
		mav = new ModelAndView();

		mav.setViewName("data/dataWrite");
		return mav;
	}

	// 자료실 글 등록 + 파일 업로드
	@PostMapping("dataWriteOk") // 파일 업로드 위치, 파일 업로드하는 프레임 워크인 > multipartRequest객체를 구한다.
	public ResponseEntity<String> dataWriteOk(DataVO vo, HttpServletRequest a) { // VO엔 제목과 글내용만 들어가있음 파일첨부의 경우 name이 다르기 때문에 매칭시켜주지않음
		// 업로드 할 위치의 절대경로
		String path = a.getSession().getServletContext().getRealPath("/upload");
		System.out.println(path);
		//리스폰스 entity변수선언
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-type", "text/html; charset=utf-8");
		

		// 파일 업로드 ----
		String message = "";//entity의 컨텐츠로 사용할 변수
		try {
			// 1. DATAVO에 제목 글내용을 reqest되어있다.
			// 2. 클라이언트 컴퓨터에 있는 파일이 서버로 복사하기 위해서는 MultipartHttpServletRequest객체를 a객체에서
			// 타입캐스팅을 한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) a;
			// mr에는 업로드한 파일 수 만큼 multipartFile객체가 존제한다.
			// multipartFile객체를 List컬렉션에 담아 리턴해준다.
			List<MultipartFile> file = mr.getFiles("filename");
			// 업로드한 파일이 있을때
			if (file != null) {// if1
				//첨부한 파일의 수 만큼 반본적으로 업로드를 처리한다.
				int cnt=0;//업호드 번호매기기
				for(int i=0; i<file.size();i++) {// for1
					//List에서 multipartFile객체 얻어오기
					MultipartFile mf = file.get(i);
					//업로드한 실제 파일명
					String orgName = mf.getOriginalFilename();
					System.out.println(orgName);
					
					//이미 파일명이 존제할 경우 리네임을 하는 작업을 수행을 해야한다
					if(orgName != null && !orgName.equals("")) {//if2 월래 파일명이 있을때
						File f = new File(path, orgName);
						//파일명이 존재하면 파일명을 변경을 해야한다.
						if(f.exists()) {//if3 있으면true, 없으면 false
							//파일명 변경
							for(int ii=1;;ii++) {
								// a_1.gif
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0, dot);
								String extName = orgName.substring(dot+1);
								
								f = new File(path, fileName+"_"+ii+"."+extName);
								if(!f.exists()) {
									//없으면 다른파일명을 만들 필요없음.
									orgName = f.getName(); // 파일명 + 확장자를 구해줌.
									break;
								}
							}
						}//if3
						//파일업로드 실행
						mf.transferTo(f);
						cnt++;
						if(cnt==1) vo.setFilename1(f.getName());
						if(cnt==2) vo.setFilename2(f.getName());
						//
					}//if2
				}

			} // if1
			//DB등록
			vo.setUserid((String)a.getSession().getAttribute("logId"));
			
			int cnt = service.dataInsert(vo);//레코드 추가
			if(cnt>0) {
				//등록성공
				//리스트로 이동
				message += "<script>";
				message += "alert('자료실에 등록이 완료되었습니다');";
				message += "location.href='/data/dataList'";
				message += "</script>";
			}else {
				//등록실패시 catch문으로 가게 만들기
				throw new Exception();
			}
		} catch (Exception e) {
			//등록실패
			//파일을 지우고 글 등록으로 다시보내기
			e.printStackTrace();
			
			fileDelete(path, vo.getFilename1());
			fileDelete(path, vo.getFilename2());
			
			message += "<script>";
			message += "alert('글등록이 실패하였습니다');";
			message += "history.go(-1);";
			message += "</script>";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(message, headers, HttpStatus.OK);
		return entity;
		

	}
	public void fileDelete(String path, String filename) {
		try {
			if(filename!=null){
				File file = new File(path, filename);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//다운로드 회수 수정
	@GetMapping("downCountUpdate")
	public int downCountUpdate(int no) {
		//다운로드 횟수 업데이트
		//새로운 다룬로드 횟수를 구해와야한다.
		service.downCountUpdate(no);
		
		return service.newDownCount(no);
	}
	//글 내용 보기
	@GetMapping("dataView/{no}")
	public ModelAndView dataView(@PathVariable("no") int no) {
		mav = new ModelAndView();
		service.hitCount(no); // 조회수 증가
		mav.addObject("dataVO", service.dataSelect(no)); //레코드 선택
		mav.setViewName("data/dataView");
		return mav;

	
	}
	//글 수정 폼
	@GetMapping("dataEditForm1/{aa}") //매핑주소
	public ModelAndView dataEditForm(@PathVariable("aa") int no) {
		mav = new ModelAndView();
		mav.addObject("vo", service.dataSelect(no));
		mav.setViewName("data/dataEditForm"); //jsp파일명 둘이 달라도됨
		return mav;
	}
	
	//글수정(DB)
	@PostMapping("dataEditFormOk") // 번호 제목 글내용 삭제파일명 //새로 업로드될 파일
	public ResponseEntity<String> dataEditFormOk(DataVO vo, HttpServletRequest request){
		//DB에 있는 파일명을 보관한다.
		System.out.println(222);
		DataVO dbFile = service.getFilenames(vo.getNo());
		//최종으로 사용할 파일명을 정리
		List<String> editFileList = new ArrayList<String>();
		editFileList.add(dbFile.getFilename1());
		if(dbFile.getFilename2()!=null) {
			editFileList.add(dbFile.getFilename2());
		}
		//삭제 파일명과 같은 파일을 최종파일을 저장하는 컬렉션에서 제거하기
		if(vo.getDelFile()!=null) {
			for(String del : vo.getDelFile()) {
				editFileList.remove(del);
			}		
		}
		//업로드할 위치
		String path = request.getServletContext().getRealPath("/upload");
		//새로 업로드한 파일명 보관할 컬렉션
		List<String> newUpload = new ArrayList<String>();
		
		String msg=""; //스크립트를 넣을 변수
		//새로업로드
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> newMf = mr.getFiles("filename");
			
			if(newMf!=null) {
				//업ㄹ호드한 파일이 있으면
				for(int i=0; i<newMf.size(); i++){
					MultipartFile mf = newMf.get(i);
					String org_filename = mf.getOriginalFilename();
					
					if(org_filename != null && !org_filename.equals("")) {
						File file = new File(path, org_filename);
						if(file.exists()) {
							for(int j=1; ; j++) {
								int p = org_filename.lastIndexOf(".");
								String filenameNoExt = org_filename.substring(0,p);
								String ext = org_filename.substring(p);
								String renameFilename = filenameNoExt+"_"+j+ext;
								file = new File(path, renameFilename);
								if(!file.exists()) {
									org_filename = renameFilename;
									break;
								}
							}//for
						}
						//업로드
						mf.transferTo(file);
						newUpload.add(file.getName());
						editFileList.add(file.getName());
					}
				}
			}
			//DB update
			//수정할 파일명이 있는 컬렉션의 값을 filename1 filename2에 세팅하여야 한다
			for(int i =0; i<editFileList.size(); i++) {
				if(i==0) vo.setFilename1(editFileList.get(0));
				if(i==1) vo.setFilename2(editFileList.get(1));
			}
			//세션에 로그인한 아이디
			System.out.println(111);
			vo.setUserid((String)request.getSession().getAttribute("logId"));
			int result = service.dataUpdate(vo);
			
			if(result>0) {//수정됨
				//삭제한 파일을 지운다
				if(vo.getDelFile()!=null) {
					for(String f:vo.getDelFile()) {
						fileDelete(path,f);
					}
				}
				//글내용 보기로 페이지 이동
				msg = "<script>";
				msg += "alert('글수정성공');";
				msg += "location.href='/data/dataView/"+vo.getNo()+"'";
				msg += "</script>";
				
			}else {//수정실패
				throw new Exception();

			}
			
		} catch (Exception e) {
			// TODO: handle exception
			//update실패
			//새로 업로드 된 파일을 지운다
			//수정페이지로 이동 (history)
			for(String f : newUpload) {
				fileDelete(path,f);
			}
			//수정페이지로 이동(history)
			msg += "<script>";
			msg += "alert('글수정실패');";
			msg += "history.back();";
			msg += "</script>";
		}
		HttpHeaders h = new HttpHeaders();
		h.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		h.add("content-Type", "text/html; charset=UTF-8");
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, h, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("dataDelete/{no}")
	public ModelAndView dataDelete(@PathVariable("no") int no,HttpSession session) { //no 를 받아서 인트 no에 넣어라
		String userid = (String)session.getAttribute("logId");
		
		//파일명을 DB에서 조회
		DataVO fileVO = service.getFilenames(no);
		
		int result = service.dataDelete(no, userid);
		
		mav = new ModelAndView();
		if(result>0 ) {
			//파일도 삭제해야한다
			String path = session.getServletContext().getRealPath("/upload");
			fileDelete(path, fileVO.getFilename1());
			fileDelete(path, fileVO.getFilename2());
			//삭제
			mav.setViewName("redirect:/data/dataList");
		}else {
			//삭제실패
			mav.setViewName("redirect:/data/dataView/"+no);
		}
		return mav;
	}

}

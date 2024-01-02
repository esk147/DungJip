package com.kh.dungjip.house.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dungjip.house.model.dao.HouseEnrollDao;
import com.kh.dungjip.house.model.service.HouseEnrollService;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Controller
@RequestMapping("/house")
public class HouseEnrollController {
	
	@Autowired
	private HouseEnrollService houseEnrollService;
	
	
    @GetMapping("/enrollForm")
    public String enrollForm() {

        return "house/enrollHouseForm";
    }

    @PostMapping("/enroll")
    public String enrollHouse(House house, @RequestParam("files") MultipartFile[] files) {
    	System.out.println(house);
      int houseNo = houseEnrollService.enrollHouse(house); // 매물 정보 저장

      // 파일 저장 경로를 지정합니다.
      String uploadPath = "src/main/webapp/resources/houseimg/";

      if (files != null && files.length > 0) {
        // 파일 처리 로직
        int fileCount = Math.min(files.length, 4); // 첨부 파일은 최대 4개까지 처리
        for (int i = 0; i < fileCount; i++) {
          MultipartFile file = files[i];
          if (!file.isEmpty()) {
            String originName = file.getOriginalFilename();
            String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
            int ranNum = (int) (Math.random() * 90000 + 10000);
            String ext = originName.substring(originName.lastIndexOf("."));
            String changeName = currentTime + ranNum + ext;

            try {
              // 경로를 포함한 전체 파일 경로를 구성합니다.
              File dir = new File(uploadPath);
              if (!dir.exists()) {
                dir.mkdirs(); // 디렉토리가 없다면 생성합니다.
              }
              File uploadFile = new File(dir, changeName);
              file.transferTo(uploadFile);

              // HouseImg 객체 생성 및 정보 저장
              HouseImg houseImg = new HouseImg();
              houseImg.setHouseNo(houseNo);
              houseImg.setOriginName(originName);
              houseImg.setChangeName(changeName);
              houseEnrollService.enrollHouseImg(houseImg);
            } catch (Exception e) {
              e.printStackTrace();
              // 파일 저장 실패 처리
            }
          }
        }
      }

      return "redirect:/house/enrollForm"; 
    }
  }
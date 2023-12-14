package com.kh.dungjip.estate.model.vo;

import com.kh.dungjip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Estate {

	private int esNo;
	private int userNo;//회원번호
	private String esName;
	private String esCeo;
	private String esPhone;
	private String esNum;
	private String esRegisterNum;
	private String esAddress;
	private String esContent;
	private String esImage;
	private int esCount;
	private String esStatus;
		
}

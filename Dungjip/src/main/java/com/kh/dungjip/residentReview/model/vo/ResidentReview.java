package com.kh.dungjip.residentReview.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentReview {
	private int reReviewNo;	//	RE_REVIEW_NO	NUMBER
	private int userNo;	//	USER_NO	NUMBER
	private int houseNo;	//	HOUSE_NO	NUMBER
	private int keywordNo;	//	KEYWORD_NO	NUMBER
	private int interiorScore;	//	INTERIOR_SCORE	NUMBER
	private int buildingScore;	//	BUILDING_SCORE	NUMBER
	private int trafficScore;	//	TRAFFIC_SCORE	NUMBER
	private int safetyScore;	//	SAFETY_SCORE	NUMBER
	private int lifeScore;	//	LIFE_SCORE	NUMBER
	private String reAdContent;	//	RE_AD_CONTENT	VARCHAR2(1000 BYTE)
	private String reDisContent;	//	RE_DIS_CONTENT	VARCHAR2(1000 BYTE)
	private Date reCreateDate;	//	RE_CREATE_DATE	DATE
	private String rePeriod;	//	RE_PERIOD	VARCHAR2(100 BYTE)
	private String reFloor;	//	RE_FLOOR	VARCHAR2(100 BYTE)
	private String status;	//	STATUS	CHAR(1 BYTE)
}

package com.kh.dungjip.estateReview.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EstateReview {
		private int esReNo;//	ES_RE_NO	NUMBER
		private int esNo;//	ES_NO	NUMBER
		private int userNo;//	USER_NO	NUMBER
		private int esReScore;//	ES_RE_SCORE	NUMBER
		private String esReContent;//	ES_RE_CONTENT	VARCHAR2(1000 BYTE)
		private Date esReCreateDate;//	ES_RE_CREATE_DATE	DATE
		private int esReType;//	ES_RE_TYPE	NUMBER
		private String esReStatus;//	ES_RE_STATUS	CHAR(1 BYTE)
		private int houseNo;//	HOUSE_NO	NUMBER
	
	
}

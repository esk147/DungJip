package com.kh.dungjip.common.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReportEstate {
private int reportNo;
private int userNo;
private int chatRoomNo;
private int EstateNo;
private String reportReason;
public ReportEstate(int userNo, int chatRoomNo, int estateNo, String reportReason) {
	super();
	this.userNo = userNo;
	this.chatRoomNo = chatRoomNo;
	EstateNo = estateNo;
	this.reportReason = reportReason;
}





}

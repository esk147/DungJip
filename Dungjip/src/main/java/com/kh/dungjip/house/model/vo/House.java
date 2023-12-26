package com.kh.dungjip.house.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class House {

	private int houseNo;
	private String housePrice;
	private int houseRent;
	private Double houseSquare;
	private String houseStyle;
	private String houseTitle;
	private String houseDetails;
	private String houseType;
	private Double houseLatitude;
	private Double houseLongitude;
	private Date houseUploadTime;
	private String houseAddress;
	private int houseFloor;
	private int houseBuildingFloor;
	private int houseToilet;
	private int houseRooms;
	private int houseParkAble;
	private String houseBalcony;
	private int houseMaintainCost;
	private String houseDoItNow;
	private Date houseBuildDate;
	private String houseAnimals;
	private String status;
	
}

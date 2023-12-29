package com.kh.dungjip.house.model.vo;
import java.sql.Date;
import com.kh.dungjip.estate.model.vo.Estate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reservation {
	private int reservationNo;
	private int esNo;
	private int userNo;
	private Date reservationDate;
	private int timeNo;
	
	public Time time;
	
	public Time getTime() {
		return time;
	}
	
	public void setTime(Time time) {
		this.time = time;
	}
	
	public Estate estate;
	
	public Estate getEstate() {
		return estate;
	}
	
	public void setEstate(Estate estate) {
		this.estate = estate;
	}
}
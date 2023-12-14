package com.kh.dungjip.member.model.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    
    private int userNo;     //  USER_NO
    private String userType;        //  USER_TYPE
    private String userId;//    USER_ID
    private String userPwd;//   USER_PWD
    private String userName;//  USER_NAME
    private String userNickName;//  USER_NICKNAME
    private String age;         //커맨트 객체방식으로 주입받을때 ""이 int에는 들어갈 수 없으니 String 으로 만들어주기
    private String gender;//    GENDER
    private String email;// EMAIL
    private String phone;// PHONE
    private String address;//   ADDRESS
    private String preferLocation;//    PREFER_LOCATION
    private String preferCheck1;//  PREFER_CHECK1
    private String preferCheck2;//  PREFER_CHECK2
    private String preferCheck3;//  PREFER_CHECK3
    private String status;//    STATUS

    private String originName;
    private String changeName;

    

	public Member(int userNo, String userType, String userId, String userPwd, String userName, String userNickName,
			String age, String gender, String email, String phone, String address, String status,String originName, String changeName) {
		super();
		this.userNo = userNo;
		this.userType = userType;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.status = status;
		this.originName = originName;
		this.changeName= changeName;
	}
    
    
    
}

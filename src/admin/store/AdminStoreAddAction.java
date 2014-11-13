package admin.store;

import admin.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import db.StoreDTO;

public class AdminStoreAddAction extends ActionSupport implements IbatisAware{

	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String check=null;  // page 구분 변수
	
	private String location;
	private String storename;
	private String phone;
	private String address;
	private String businesshours;
	private String storetype;
	private String storeparking;
	private String latitude;
	private String longitude;
	private String newopen;
	private String imagepath;
	
	public String execute() throws Exception{
		StoreDTO dto = new StoreDTO();
		
		dto.setLocation(getLocation());
		dto.setStorename(getStorename());
		dto.setPhone(getPhone());
		dto.setAddress(getAddress());
		dto.setBusinesshours(getBusinesshours());
		dto.setStoretype(getStoretype());
		dto.setStoreparking(getStoreparking());
		dto.setLatitude(getLatitude());
		dto.setLongitude(getLongitude());
		dto.setNewopen(getNewopen());
		dto.setImagepath(getImagepath());
		
		sqlMapper.insert("storeSQL.insertStore",dto);
		
		return SUCCESS;
	}
	
	public String form() throws Exception{
		//등록폼
		return SUCCESS;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	public String getCheck() {
		System.out.println("AdminStoreAddAction getCheck()  check : " + check);
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
		System.out.println("AdminStoreAddAction setCheck()  check : " + this.check);
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusinesshours() {
		return businesshours;
	}

	public void setBusinesshours(String businesshours) {
		this.businesshours = businesshours;
	}

	public String getStoretype() {
		return storetype;
	}

	public void setStoretype(String storetype) {
		this.storetype = storetype;
	}

	public String getStoreparking() {
		return storeparking;
	}

	public void setStoreparking(String storeparking) {
		this.storeparking = storeparking;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getNewopen() {
		return newopen;
	}

	public void setNewopen(String newopen) {
		this.newopen = newopen;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
}

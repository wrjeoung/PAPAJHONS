package store;

import com.opensymphony.xwork2.ActionSupport;

public class StoreMapAction extends ActionSupport{
	
	private String storename;
	private String phone;
	private String address;
	private String businesshours;
	private String storetype;
	private String storeparking;
	private String imagepath;
	private String latitude;
	private String longitude;
	
	public String execute() throws Exception{
		return SUCCESS;
	}

	public String getStorename() {
		System.out.println("StoreMapAction getStorename() storename : " + storename);
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
		System.out.println("StoreMapAction setStorename() storename : " + storename);
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
		System.out.println("StoreMapAction getStoretype() storetype : " + storetype);
		return storetype;
	}

	public void setStoretype(String storetype) {
		this.storetype = storetype;
		System.out.println("StoreMapAction setStoretype() storetype : " + storetype);
	}

	public String getStoreparking() {
		return storeparking;
	}

	public void setStoreparking(String storeparking) {
		this.storeparking = storeparking;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
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
}

package admin.store;

import java.io.File;

import org.apache.commons.io.FileUtils;

import admin.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import db.StoreDTO;

public class AdminStoreModifyAction extends ActionSupport implements IbatisAware {

	public static SqlMapClient sqlMapper;   //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String check = null;  // page 구분 변수
	private String store;
	private StoreDTO dto = null;
	
	private int no;
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
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "\\\\192.168.10.77\\Imageupload\\"; //업로드 경로.
	private String old_file;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
	}

	public String execute() throws Exception{
		
		StoreDTO dtos = new StoreDTO();
		
		dtos.setNo(getNo());
		dtos.setLocation(getLocation());
		dtos.setStorename(getStorename());
		dtos.setPhone(getPhone());
		dtos.setAddress(getAddress());
		dtos.setBusinesshours(getBusinesshours());
		dtos.setStoretype(getStoretype());
		dtos.setStoreparking(getStoreparking());
		dtos.setLatitude(getLatitude());
		dtos.setLongitude(getLongitude());
		dtos.setNewopen(getNewopen());
		
		sqlMapper.update("storeSQL.updateStore", dtos);
		
		if (getUpload() != null) {
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "str_" + dtos.getNo();
		           String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
			//이전 파일 삭제
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			//새 파일 업로드
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정.
			dtos.setImagepath(file_name + "." + file_ext);
			//파일 정보 업데이트.
			sqlMapper.update("storeSQL.updateFile", dtos);
		}		
		
		return SUCCESS;
	}
	
	public String modify() throws Exception{
		//수정폼
		System.out.println("AdminStoreModifyAction modify() storename : " + store);
		dto = (StoreDTO) sqlMapper.queryForObject("storeSQL.selectStoreNo",store);
		
		System.out.println("dto.address : " + dto.getAddress());
		//System.out.println("dto.address : " + dto.getStorename());
		return SUCCESS;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public StoreDTO getDto() {
		return dto;
	}

	public void setDto(StoreDTO dto) {
		this.dto = dto;
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

package admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import org.apache.commons.io.FileUtils;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import db.MenuDTO;

public class MenuItemModifyAction implements Action, IbatisAware,Preparable, ModelDriven<MenuDTO>  {
	private static SqlMapClient sqlMapper;
	private String menuCategory;
	private MenuDTO list;
	private String defaultFileName;
	private String fileUploadPath = "\\\\192.168.10.77\\Imageupload\\"; //업로드 경로.
	
	File menuImg;
	File detailImg1;
	File detailImg2;
	File orderImg;
	
	private String oldMenuFileName;
	private String oldDetail1FileName;
	private String oldDetail2FileName;
	private String oldOrderFileName;
	
	// struts에서 calling하는 멤버. 커스텀 파일객체 뒤에 FileName을 붙여서 만든다.
	private String menuImgFileName;
	private String detailImg1FileName;
	private String detailImg2FileName;
	private String orderImgFileName;
	
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String modifyPro() throws SQLException, IOException {
		System.out.println("MenuItemModifyAction medifyPro() menuid : "+list.getMenuid());
		System.out.println("MenuItemModifyAction medifyPro() no : "+list.getNo());
		System.out.println("MenuItemModifyAction medifyPro() old_detail1 : "+getOldDetail1FileName());
		System.out.println("MenuItemModifyAction medifyPro() old_datail2 : "+getOldDetail2FileName());
		System.out.println("MenuItemModifyAction medifyPro() old_menu : "+getOldMenuFileName());
		System.out.println("MenuItemModifyAction medifyPro() old_order : "+getOldOrderFileName());
		System.out.println("MenuItemModifyAction medifyPro() menuImg : "+getMenuImg());
		
		sqlMapper.update("menuSQL.updateMenu",list);
		
		if (getMenuImg() != null
				|| getDetailImg1() != null
				|| getDetailImg2() != null
				|| getOrderImg() != null) {
			
			defaultFileName="file_"+list.getNo();
			saveMenuImageName();
			saveDetail1ImageName();
			saveDetail2ImageName();
			saveOrderImageName();
			System.out.println("MenuItemModifyAction medifyPro() : "+getMenuImgFileName());
			sqlMapper.update("menuSQL.updateFile", list);
		}
		
		return SUCCESS;
	}
	
	public void saveMenuImageName() throws IOException {
		if (getMenuImg() != null)
		{
			String file_name_menu = defaultFileName;
			
			String file_ext_menu = getMenuImgFileName().substring(
					getMenuImgFileName().lastIndexOf('.') + 1,
					getMenuImgFileName().length());
			
			File deleteFile = new File(fileUploadPath + getOldMenuFileName());
			deleteFile.delete();
			
			//서버에 파일 저장.
			File destFile_menu = new File(fileUploadPath + defaultFileName + "."
					+ file_ext_menu);
			FileUtils.copyFile(getMenuImg(), destFile_menu);
			
			String menuFileName = file_name_menu+"."+ file_ext_menu;
			
			//실제 이미지 이름 저장
			list.setOrgmenufilename(getMenuImgFileName());
			//서버에 저장된 이름 저장
			list.setImagepath1(menuFileName);
		}
	}
	
	public void saveDetail1ImageName() throws IOException {
		if (getDetailImg1() != null)
		{
			String file_name_detail1 = defaultFileName + "detail1";
			
			String file_ext_detail1 = getDetailImg1FileName().substring(
					getDetailImg1FileName().lastIndexOf('.') + 1,
					getDetailImg1FileName().length());
			
			File deleteFile = new File(fileUploadPath + getOldDetail1FileName());
			deleteFile.delete();
			
			//서버에 파일 저장.
			File destFile_detail1 = new File(fileUploadPath + file_name_detail1 + "."
					+ file_ext_detail1);
			FileUtils.copyFile(getDetailImg1(), destFile_detail1);
			
			String detail1FileName = file_name_detail1+"."+file_ext_detail1;
			
			//실제 이미지 이름 저장
			list.setOrgdetail1filename(getDetailImg1FileName());
			//서버에 저장된 이름 저장
			list.setImagepath2(detail1FileName);
		}
	}
	
	public void saveDetail2ImageName() throws IOException {
		if (getDetailImg2() != null)
		{
			String file_name_detail2 = defaultFileName + "detail2";
			
			String file_ext_detail2 = getDetailImg2FileName().substring(
					getDetailImg2FileName().lastIndexOf('.') + 1,
					getDetailImg2FileName().length());
			
			File deleteFile = new File(fileUploadPath + getOldDetail2FileName());
			deleteFile.delete();
			
			//서버에 파일 저장.
			File destFile_detail2 = new File(fileUploadPath + file_name_detail2 + "."
					+ file_ext_detail2);
			FileUtils.copyFile(getDetailImg2(), destFile_detail2);
			
			String detail1FileName = file_name_detail2+"."+ file_ext_detail2;
			
			//실제 이미지 이름 저장
			list.setOrgdetail2filename(getDetailImg1FileName());
			
			//서버에 저장한 파일 이름
			list.setImagepath3(detail1FileName);
		}
	}
	
	public void saveOrderImageName() throws IOException {
		if (getOrderImg() != null)
		{
			String file_name_order = defaultFileName + "order";
			
			String file_ext_order = getOrderImgFileName().substring(
					getOrderImgFileName().lastIndexOf('.') + 1,
					getOrderImgFileName().length());
			
			File deleteFile = new File(fileUploadPath + getOldOrderFileName());
			deleteFile.delete();

			//서버에 파일 저장.
			File destFile_order = new File(fileUploadPath + file_name_order + "."
					+ file_ext_order);

			FileUtils.copyFile(getOrderImg(), destFile_order);	
			String orderFileName = file_name_order + "."+ file_ext_order;
			
			// 실제 이미지 이름
			list.setOrgordername(getOrderImgFileName());
			// 서버에 저장한 파일 이름
			list.setImagepathorder(orderFileName);
		}
	}
	
	public String getOldMenuFileName() {
		return oldMenuFileName;
	}

	public void setOldMenuFileName(String oldMenuFileName) {
		this.oldMenuFileName = oldMenuFileName;
	}

	public String getOldDetail1FileName() {
		return oldDetail1FileName;
	}

	public void setOldDetail1FileName(String oldDetail1FileName) {
		this.oldDetail1FileName = oldDetail1FileName;
	}

	public String getOldDetail2FileName() {
		return oldDetail2FileName;
	}

	public void setOldDetail2FileName(String oldDetail2FileName) {
		this.oldDetail2FileName = oldDetail2FileName;
	}

	public String getOldOrderFileName() {
		return oldOrderFileName;
	}

	public void setOldOrderFileName(String oldOrderFileName) {
		this.oldOrderFileName = oldOrderFileName;
	}

	public String getMenuImgFileName() {
		return menuImgFileName;
	}

	public void setMenuImgFileName(String menuImgFileName) {
		this.menuImgFileName = menuImgFileName;
	}

	public String getDetailImg1FileName() {
		return detailImg1FileName;
	}

	public void setDetailImg1FileName(String detailImg1FileName) {
		this.detailImg1FileName = detailImg1FileName;
	}

	public String getDetailImg2FileName() {
		return detailImg2FileName;
	}

	public void setDetailImg2FileName(String detailImg2FileName) {
		this.detailImg2FileName = detailImg2FileName;
	}

	public String getOrderImgFileName() {
		return orderImgFileName;
	}

	public void setOrderImgFileName(String orderImgFileName) {
		this.orderImgFileName = orderImgFileName;
	}

	public File getMenuImg() {
		return menuImg;
	}

	public void setMenuImg(File menuImg) {
		this.menuImg = menuImg;
	}

	public File getDetailImg1() {
		return detailImg1;
	}

	public void setDetailImg1(File detailImg1) {
		this.detailImg1 = detailImg1;
	}

	public File getDetailImg2() {
		return detailImg2;
	}

	public void setDetailImg2(File detailImg2) {
		this.detailImg2 = detailImg2;
	}

	public File getOrderImg() {
		return orderImg;
	}

	public void setOrderImg(File orderImg) {
		this.orderImg = orderImg;
	}

	public String getMenuCategory() {
		return menuCategory;
	}

	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}

	public MenuDTO getModel() {
		return list;
	}

	public void prepare() throws Exception {
		list = new MenuDTO();
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

}


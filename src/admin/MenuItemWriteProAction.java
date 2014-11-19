package admin;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import db.MenuDTO;

public class MenuItemWriteProAction implements Action, IbatisAware, ModelDriven<MenuDTO>, Preparable {
	static private SqlMapClient sqlMapper;
	private String fileUploadPath = "\\\\192.168.10.77\\Imageupload\\"; //업로드 경로.
	private String defaultFileName;
	MenuDTO list;
	File menuImg;
	File detailImg1;
	File detailImg2;
	File orderImg;	
	String menuImgFileName;
	String detailImg1FileName;
	String detailImg2FileName;
	String orderImgFileName;
	
	public String execute() throws Exception {
		if(((String)list.getMenuid()).equals("pj_noSelected"))
			return "noSelected";
		else
		{
			sqlMapper.insert("menuSQL.insertMenu", list);
			
			if (getMenuImg() != null
					|| getDetailImg1() != null
					|| getDetailImg2() != null
					|| getOrderImg() != null) {
				list = (MenuDTO) sqlMapper.queryForObject("menuSQL.selectLastNo");
				defaultFileName="file_"+list.getNo();
				saveMenuImageName();
				saveDetail1ImageName();
				saveDetail2ImageName();
				saveOrderImageName();
				sqlMapper.update("menuSQL.updateFile", list);
			}
			return SUCCESS;
		}
	}
	
	public void saveMenuImageName() throws IOException {
		if (getMenuImg() != null)
		{
			String file_name_menu = defaultFileName;
			
			String file_ext_menu = getMenuImgFileName().substring(
					getMenuImgFileName().lastIndexOf('.') + 1,
					getMenuImgFileName().length());
			
			//서버에 파일 저장.
			File destFile_menu = new File(fileUploadPath + defaultFileName + "."
					+ file_ext_menu);
			FileUtils.copyFile(getMenuImg(), destFile_menu);
			
			String menuFileName = file_name_menu+"."+ file_ext_menu;
			
			//실제 이미지 이름 저장
			list.setOrgmenufilename(getMenuImgFileName());
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
			
			//서버에 파일 저장.
			File destFile_detail1 = new File(fileUploadPath + file_name_detail1 + "."
					+ file_ext_detail1);
			FileUtils.copyFile(getDetailImg1(), destFile_detail1);
			
			String detail1FileName = file_name_detail1+"."+file_ext_detail1;
			
			//실제 이미지 이름 저장
			list.setOrgdetail1filename(getDetailImg1FileName());
			
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

			//서버에 파일 저장.
			File destFile_order = new File(fileUploadPath + file_name_order + "."
					+ file_ext_order);

			FileUtils.copyFile(getOrderImg(), destFile_order);	
			String orderFileName = file_name_order + "."+ file_ext_order;
			
			// 실제 이미지 이름

			list.setOrgordername(getOrderImgFileName());
			
			// 서버에 저장한 파일 이

			list.setImagepathorder(orderFileName);
		}
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

	public MenuDTO getModel() {
		return list;
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public void prepare() throws Exception {
		list = new MenuDTO();
	}
}

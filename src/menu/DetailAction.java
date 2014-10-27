package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuDTO;

public class DetailAction implements Action , IbatisAware{
	private String menuName; 
	private String menuLagCode; // 메뉴대분류코드
	private String menuMidCode; // 메뉴중분류코드
	private String menuSubCode; // 메뉴소분류코드
	private String menuDtlImage; // 온라인 메뉴상세 이미지 파일
	private String menuSeq; // 메뉴순번
	private String menuCode; // 메뉴코드
	private String onGrpCode; // 온라인 메뉴 그룹.
	private String bestOnlineGroupCd;
	
	public static SqlMapClient sqlMapper;
	private MenuDTO list = new MenuDTO();
	
	public String execute() throws Exception {
//		System.out.println(menuName);
//		System.out.println(menuLagCode);
//		System.out.println(menuMidCode);
//		System.out.println(menuSubCode);
//		System.out.println(menuDtlImage);
//		System.out.println(menuSeq);
//		System.out.println(menuCode);
//		System.out.println(onGrpCode);
//		System.out.println(bestOnlineGroupCd);
		System.out.println("DetailAction : " + menuName);
		
		list = (MenuDTO) sqlMapper.queryForObject("menuSQL.selectMenuName",menuName);
		
		return SUCCESS;
	}

	public MenuDTO getList() {
		return list;
	}

	public void setList(MenuDTO list) {
		this.list = list;
	}

	public String getMenuName() {
		System.out.println("DetailAction  getMenuName : " + menuName);
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
		System.out.println("DetailAction  setMenuName : " + menuName);
	}

	public String getMenuLagCode() {
		return menuLagCode;
	}

	public void setMenuLagCode(String menuLagCode) {
		this.menuLagCode = menuLagCode;
	}

	public String getMenuMidCode() {
		return menuMidCode;
	}

	public void setMenuMidCode(String menuMidCode) {
		this.menuMidCode = menuMidCode;
	}

	public String getMenuSubCode() {
		return menuSubCode;
	}

	public void setMenuSubCode(String menuSubCode) {
		this.menuSubCode = menuSubCode;
	}

	public String getMenuDtlImage() {
		return menuDtlImage;
	}

	public void setMenuDtlImage(String menuDtlImage) {
		this.menuDtlImage = menuDtlImage;
	}

	public String getMenuSeq() {
		return menuSeq;
	}

	public void setMenuSeq(String menuSeq) {
		this.menuSeq = menuSeq;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getOnGrpCode() {
		return onGrpCode;
	}

	public void setOnGrpCode(String onGrpCode) {
		this.onGrpCode = onGrpCode;
	}

	public String getBestOnlineGroupCd() {
		return bestOnlineGroupCd;
	}

	public void setBestOnlineGroupCd(String bestOnlineGroupCd) {
		this.bestOnlineGroupCd = bestOnlineGroupCd;
	}

	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

}

package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuDTO;

public class DetailAction implements Action , IbatisAware{
	private String menuName; 
	private String menuLagCode; // �޴���з��ڵ�
	private String menuMidCode; // �޴��ߺз��ڵ�
	private String menuSubCode; // �޴��Һз��ڵ�
	private String menuDtlImage; // �¶��� �޴��� �̹��� ����
	private String menuSeq; // �޴�����
	private String menuCode; // �޴��ڵ�
	private String onGrpCode; // �¶��� �޴� �׷�.
	private String bestOnlineGroupCd;
	
	// view�� display�Ǵ� ���� ����. [
	private String mlSizeImgPath;
	private String mRSizeImgPath;
	private String mSizeSelectOpt1;
	private String mSizeSelectOpt2;
	private String mRsizeName;
	private String mLsizeName;
	// view�� display�Ǵ� ���� ����. ]
	
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
		setDetailBerver();
		
		return SUCCESS;
	}
	
	public String getmBeverlSizeImgPath() {
		return mlSizeImgPath;
	}

	public String getmBeverRSizeImgPath() {
		return mRSizeImgPath;
	}

	public String getmSizeSelectOpt1() {
		return mSizeSelectOpt1;
	}

	public String getmSizeSelectOpt2() {
		return mSizeSelectOpt2;
	}

	public String getmRsizeName() {
		return mRsizeName;
	}

	public String getmLsizeName() {
		return mLsizeName;
	}

	public void setDetailBerver() {
		
		if(list.getName().equals("��������Ʈ")
		|| list.getName().equals("��ī�ݶ� ����")
				)
		{
			mRSizeImgPath = "../assets/img/menu/detail_size_500ML.gif";
			mlSizeImgPath = "../assets/img/menu/detail_size_1.5L.gif";
			mSizeSelectOpt1 = "500ml-1200";
			mSizeSelectOpt2 = "1.5L-1900";
			mRsizeName = "500ml������";
			mLsizeName = "1.5L������";
		}
		else if(list.getName().equals("��ī�ݶ�"))
		{
			mRSizeImgPath = "../assets/img/menu/detail_size_500ML.gif";
			mlSizeImgPath = "../assets/img/menu/detail_size_1.25L.gif";
			mSizeSelectOpt1 = "500ml-1100";
			mSizeSelectOpt2 = "1.25L-1600";
			mRsizeName = "500ml������";
			mLsizeName = "1.25L������";
			
		}
		else if(list.getName().equals("ȯŸ"))
		{
			mRSizeImgPath = "../assets/img/menu/detail_size_600ML.gif";
			mlSizeImgPath = "../assets/img/menu/detail_size_1.5L.gif";
			mSizeSelectOpt1 = "600ml-1200";
			mSizeSelectOpt2 = "1.5L-1900";
			mRsizeName = "600ml������";
			mLsizeName = "1.5L������";
		}
		else if(list.getName().equals("�̴� ���̵� ������"))
		{
			mRSizeImgPath = "../assets/img/menu/detail_size_350ML.gif";
			mlSizeImgPath = "../assets/img/menu/detail_size_1.25L.gif";
			mSizeSelectOpt1 = "350ml-1600";
			mSizeSelectOpt2 = "1.25L-3000";
			mRsizeName = "3500ml������";
			mLsizeName = "1.25L������";
		}
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

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

}

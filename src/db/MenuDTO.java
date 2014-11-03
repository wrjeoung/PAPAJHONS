package db;

public class MenuDTO {
	private int no;
	private String menuid;
	private String name;
	private String description;       //설명
	private String topping;           //토핑재료
	private String rprice;            //사이즈별 가격 R
	private String lprice;            //사이즈별 가격 L
	private String fprice;            //사이즈별 가격 F
	private String pprice;            //사이즈별 가격 P
	private String boxprice;          //사이즈별 가격 BOX
	private String onesizeprice;      //사이즈별 가격 one size
	private String onepackprice;      //사이즈별 가격 1pack
	private String setprice;          //사이즈별 가격 SET
	private String allergy;           //알레르기음식표기
	private String consist;           //메뉴구성
	private String material;          //재료
	private String present;           //증정
	private String presentsauce;      //증정소스
	private String calorie;           //칼로리         내용이 없으면 '준비중'
	private String nuturition;        //영양정보      내용이 없으면 '준비중'
	private String imagepath1;
	private String imagepath2;
	private String imagepath3;
	private String menulagcode;      // 메뉴대분류코드
	private String menumidcode;      // 메뉴중분류코드
	private String menusubcode;      // 메뉴세분류코드
	private String menudtlimage;     // 온라인메뉴상세이미지파일
	private String menuseq;          // 메뉴순번
	private String menucode;         // 메뉴코드
	private String ongrpcode;        // 온라인메뉴그룹코드
	private String imagepathorder;   // 주문하기 이미지 패스
		
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMenuid() {
		return menuid;
	}
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTopping() {
		return topping;
	}
	public void setTopping(String topping) {
		this.topping = topping;
	}
	public String getRprice() {
		return rprice;
	}
	public void setRprice(String rprice) {
		this.rprice = rprice;
	}
	public String getLprice() {
		return lprice;
	}
	public void setLprice(String lprice) {
		this.lprice = lprice;
	}
	public String getFprice() {
		return fprice;
	}
	public void setFprice(String fprice) {
		this.fprice = fprice;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getBoxprice() {
		return boxprice;
	}
	public void setBoxprice(String boxprice) {
		this.boxprice = boxprice;
	}
	public String getOnesizeprice() {
		return onesizeprice;
	}
	public void setOnesizeprice(String onesizeprice) {
		this.onesizeprice = onesizeprice;
	}
	public String getOnepackprice() {
		return onepackprice;
	}
	public void setOnepackprice(String onepackprice) {
		this.onepackprice = onepackprice;
	}
	public String getSetprice() {
		return setprice;
	}
	public void setSetprice(String setprice) {
		this.setprice = setprice;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getConsist() {
		return consist;
	}
	public void setConsist(String consist) {
		this.consist = consist;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	public String getPresentsauce() {
		return presentsauce;
	}
	public void setPresentsauce(String presentsauce) {
		this.presentsauce = presentsauce;
	}
	public String getCalorie() {
		return calorie;
	}
	public void setCalorie(String calorie) {
		this.calorie = calorie;
	}
	public String getNuturition() {
		return nuturition;
	}
	public void setNuturition(String nuturition) {
		this.nuturition = nuturition;
	}
	public String getImagepath1() {
		return imagepath1;
	}
	public void setImagepath1(String imagepath1) {
		this.imagepath1 = imagepath1;
	}
	public String getImagepath2() {
		return imagepath2;
	}
	public void setImagepath2(String imagepath2) {
		this.imagepath2 = imagepath2;
	}
	public String getImagepath3() {
		return imagepath3;
	}
	public void setImagepath3(String imagepath3) {
		this.imagepath3 = imagepath3;
	}
	public String getMenulagcode() {
		return menulagcode;
	}
	public void setMenulagcode(String menulagcode) {
		this.menulagcode = menulagcode;
	}
	public String getMenumidcode() {
		return menumidcode;
	}
	public void setMenumidcode(String menumidcode) {
		this.menumidcode = menumidcode;
	}
	public String getMenusubcode() {
		return menusubcode;
	}
	public void setMenusubcode(String menusubcode) {
		this.menusubcode = menusubcode;
	}
	public String getMenudtlimage() {
		return menudtlimage;
	}
	public void setMenudtlimage(String menudtlimage) {
		this.menudtlimage = menudtlimage;
	}
	public String getMenuseq() {
		return menuseq;
	}
	public void setMenuseq(String menuseq) {
		this.menuseq = menuseq;
	}
	public String getMenucode() {
		return menucode;
	}
	public void setMenucode(String menucode) {
		this.menucode = menucode;
	}
	public String getOngrpcode() {
		return ongrpcode;
	}
	public void setOngrpcode(String ongrpcode) {
		this.ongrpcode = ongrpcode;
	}
	public String getImagepathorder() {
		return imagepathorder;
	}
	public void setImagepathorder(String imagepathorder) {
		this.imagepathorder = imagepathorder;
	}
}

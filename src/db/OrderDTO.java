package db;

public class OrderDTO {
	private int no; 
	private String type; 			// ��Ʈ�޴�, ���̵�, �����÷���, ����
	private String name;  			// �޴� �̸�
	private String description; 	// ��Ʈ�޴� ����
	private String consist;			// ��(�޴�����)
	private String imagepath;		// �̹��� ���.
	private String r_price;			// ���� regular size ����
	private String l_price;			// ���� large size ����
	private String f_price;			// ���� family size ����
	private String p_price;			// ���� premium size ����
	private String one_price;		// set, box ����ǥ�� ����.
	private String r_beveprice;		// ���� regular size ����  
	private String l_beveprice;		// ���� large size ���� 
	private String sauce;			// �ҽ� ��
	private String bake;			// ���� ����
	private String cheese;			// ġ�� ��
	private String cut;				// ���� Ŀ��.
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getConsist() {
		return consist;
	}
	public void setConsist(String consist) {
		this.consist = consist;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getR_price() {
		return r_price;
	}
	public void setR_price(String r_price) {
		this.r_price = r_price;
	}
	public String getL_price() {
		return l_price;
	}
	public void setL_price(String l_price) {
		this.l_price = l_price;
	}
	public String getF_price() {
		return f_price;
	}
	public void setF_price(String f_price) {
		this.f_price = f_price;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getOne_price() {
		return one_price;
	}
	public void setOne_price(String one_price) {
		this.one_price = one_price;
	}
	public String getR_beveprice() {
		return r_beveprice;
	}
	public void setR_beveprice(String r_beveprice) {
		this.r_beveprice = r_beveprice;
	}
	public String getL_beveprice() {
		return l_beveprice;
	}
	public void setL_beveprice(String l_beveprice) {
		this.l_beveprice = l_beveprice;
	}
	public String getSauce() {
		return sauce;
	}
	public void setSauce(String sauce) {
		this.sauce = sauce;
	}
	public String getBake() {
		return bake;
	}
	public void setBake(String bake) {
		this.bake = bake;
	}
	public String getCheese() {
		return cheese;
	}
	public void setCheese(String cheese) {
		this.cheese = cheese;
	}
	public String getCut() {
		return cut;
	}
	public void setCut(String cut) {
		this.cut = cut;
	}
}

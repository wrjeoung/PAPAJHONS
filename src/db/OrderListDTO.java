package db;

public class OrderListDTO {
	private int no;
	private String userid;       // 주문자 ID
	private String ordername;    // 주문상풍명
	private String size_;        // 주문상품 사이즈
	private String amount;       // 주문상품 수량
	private String price;        // 주문상품 금액
	private String deliveryinfo; // 주문자 주소
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getSize_() {
		return size_;
	}
	public void setSize_(String size_) {
		this.size_ = size_;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDeliveryinfo() {
		return deliveryinfo;
	}
	public void setDeliveryinfo(String deliveryinfo) {
		this.deliveryinfo = deliveryinfo;
	}
}

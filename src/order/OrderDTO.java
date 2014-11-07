package order;

import java.io.Serializable;

public class OrderDTO implements Serializable{
	private String name;		// 제품명
	private String size;		// 사이즈
	private String price;		// 가격
	private String amount;		// 수량
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
}

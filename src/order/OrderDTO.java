package order;

import java.io.Serializable;

public class OrderDTO implements Serializable{
	private String name;		// ��ǰ��
	private String size;		// ������
	private String price;		// ����
	private String amount;		// ����
	
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

package order;

import java.io.Serializable;

public class OrderDTO implements Serializable{
	private String name;		// 제품명
	private String size;		// 사이즈
	private String price;		// 가격
	private String amount;		// 수량
	private String addCount;
	
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
	public String getAddCount() {
		return addCount;
	}
	public void setAddCount(String addCount) {
		this.addCount = addCount;
	}
	
	public int hashCode() {
		return addCount.hashCode();
	}	

	public boolean equals(Object arg0) {
		
		if(!(arg0 instanceof OrderDTO))
			return false;
		OrderDTO od=(OrderDTO)arg0;
		return arg0!=null ? addCount.equals(od.getAddCount()) : false;
	}
	
}

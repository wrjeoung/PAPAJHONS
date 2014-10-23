package db;

public class MenuBeverageDTO {
	private int no;
	private String name;
	private String lPrice;
	private String rPice;
	private String imagePath;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getlPrice() {
		return lPrice;
	}
	public void setlPrice(String lPrice) {
		this.lPrice = lPrice;
	}
	public String getrPice() {
		return rPice;
	}
	public void setrPice(String rPice) {
		this.rPice = rPice;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

}

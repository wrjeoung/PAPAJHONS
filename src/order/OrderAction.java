package order;

import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {

	private String menuId;
	
	public String execute() throws Exception {

		return SUCCESS;
	}

	public String getMenuId() {
		System.out.println("OrderAction getMenuId ===> menuId : " + menuId);
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
		System.out.println("OrderAction setMenuId ===> menuId : " + menuId);
	}
}

package menu;

import com.opensymphony.xwork2.ActionSupport;

public class SubAction extends ActionSupport{
	
	private String menuId;
	
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String getMenuId() {
		System.out.println("getMenuId ===> menuId : " + menuId);
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
		System.out.println("setMenuId ===> menuId : " + menuId);
	}
}

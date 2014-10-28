package main;

import com.opensymphony.xwork2.Action;

public class MainAction implements Action{
	private String msg="";
	
	
	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
}

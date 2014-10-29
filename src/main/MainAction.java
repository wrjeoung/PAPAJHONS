package main;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;

public class MainAction implements Action{
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}

package admin;

import java.io.IOException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport implements SessionAware {
	private String command = "net use \\\\192.168.10.67\\ImageUpload /user:user1 open123";
	private Map sessionMap;
	private Boolean alreadySet;

	public String execute() throws Exception {
		alreadySet = (Boolean) sessionMap.get("alreadySet");
		if(alreadySet == null || alreadySet.booleanValue() == false)
		{
			alreadySet = Boolean.TRUE;
			Runtime.getRuntime().exec(command);	
		}
		return SUCCESS;
	}

	@Override
	public void setSession(Map sessionMap) {
		this.sessionMap = sessionMap;
	}
}

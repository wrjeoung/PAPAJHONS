package papa.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import papa.address.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

public class MyOrderAction extends ActionSupport implements IbatisAware,SessionAware {
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private List<MyOrderData> list = new ArrayList<MyOrderData>();
	private String sdate;
	private String edate;
	private String orderList = null;
	private Map sessionMap;
		
	public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		HashMap params = new HashMap();
		StringBuffer buffer = new StringBuffer();
		String memId = (String) sessionMap.get("memId");
		
		params.put("sdate", sdate);
		params.put("edate", edate);
		params.put("memId", memId);
		
		System.out.println("memId="+memId);
		list = sqlMapper.queryForList("myorderSQL.selectBydate",params);
		
		for(MyOrderData data : list)
		{
			String status = data.getStatus();
			if(status == null) status = "";
			
			buffer.append("<tr>");
			buffer.append("<td>"+data.getNo()+"</td>");
			buffer.append("<td>"+data.getReg_date().toString()+"</td>");
			buffer.append("<td>"+data.getNo()+"</td>");
			buffer.append("<td>"+data.getPrice()+"</td>");
			buffer.append("<td>"+data.getStore()+"</td>");
			buffer.append("<td>"+status+"</td>");
			buffer.append("</tr>");
		}
		orderList = buffer.toString();
		if(orderList.length() < 1)
		{
			orderList = "<tr><td colspan=6>조회된 내용이 없습니다.</td></tr>";
		}
	
		return SUCCESS;
	}
	
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	@Override
	public void setSession(Map arg0) {
		sessionMap = arg0;
	}
}

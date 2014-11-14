package admin.sales;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import admin.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import db.OrderListDTO;

public class AdminSalesAction extends ActionSupport implements IbatisAware{
	
	public static SqlMapClient sqlMapper;   //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private List<OrderListDTO> list = new ArrayList<OrderListDTO>();
	private String sdate;
	private String edate;
	private String orderList = null;
	private String tPriceString = "총 매출금액 : ";
	private String tCountString = "총 매출수량 : ";
	private int totalCount = 0;
	private int totalPrice = 0;
	
	
	public String form() throws Exception{
		return SUCCESS;
	}

	public String execute() throws Exception{
		HashMap params = new HashMap();
		StringBuffer buffer = new StringBuffer();
		
		params.put("sdate", sdate);
		params.put("edate", edate);
		
		list = sqlMapper.queryForList("orderListSQL.selectBydate",params);
		
		
		for(OrderListDTO data : list)
		{
			// 상품명 , 사이즈 , 수량 , 금액
			System.out.println("상품명 : " + data.getOrdername()
					+" 사이즈 : " + data.getSize_() + " 수량 : " + data.getAmount()
					+" 금액 : " + data.getPrice());
			totalPrice = totalPrice + Integer.valueOf(data.getPrice());
			totalCount = totalCount + Integer.valueOf(data.getAmount());
			
			buffer.append("<tr align=center>");
			buffer.append("<td>"+data.getOrdername()+"</td>");
			buffer.append("<td>"+data.getSize_()+"</td>");
			buffer.append("<td>"+data.getAmount()+"</td>");
			buffer.append("<td>"+data.getPrice()+"</td>");
			buffer.append("</tr>");
			
			
		}
		System.out.println("totalPrice : " + totalPrice + " totalCount : " + totalCount);
		tPriceString += totalPrice;
		tCountString += totalCount;
		System.out.println("tPriceString : " + tPriceString + " tCountString : " + tCountString);
		
		orderList = buffer.toString();
		
		System.out.println("AdminSalesAction execute()");
		
		return SUCCESS;
	}

	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	public List<OrderListDTO> getList() {
		return list;
	}

	public void setList(List<OrderListDTO> list) {
		this.list = list;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
		System.out.println("setSdate() this.sdate  : " + this.sdate);
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
		System.out.println("setEdate() this.edate : " + this.edate);
	}

	public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String gettPriceString() {
		return tPriceString;
	}

	public void settPriceString(String tPriceString) {
		this.tPriceString = tPriceString;
	}

	public String gettCountString() {
		return tCountString;
	}

	public void settCountString(String tCountString) {
		this.tCountString = tCountString;
	}
}
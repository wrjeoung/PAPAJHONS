package admin.order;

import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import db.OrderListDTO;
import admin.IbatisAware;

public class AdminOrderModifyAction extends ActionSupport implements IbatisAware{

	public static SqlMapClient sqlMapper;   //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String check = null;  // page 구분 변수
	private int no;
	private OrderListDTO dto = null;
	private String deliveryinfo;
	
	
	public String execute() throws Exception{
		System.out.println("AdminOrderModifyAction execute() no : " + getNo() + " deliveryinfo : " + getDeliveryinfo());
		
		HashMap params = new HashMap();
		params.put("no", no);
		params.put("deliveryinfo", deliveryinfo);
		
		sqlMapper.update("orderListSQL.updateAdminDel", params);
		
		
		return SUCCESS;
	}
	
	public String modify() throws Exception{
		dto = (OrderListDTO) sqlMapper.queryForObject("orderListSQL.selectAdminNo", no);
		System.out.println("dto.getNo() : " + dto.getNo());
		System.out.println("dto.getDeliveryinfo() : " + dto.getDeliveryinfo());
		return SUCCESS;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public OrderListDTO getDto() {
		return dto;
	}

	public void setDto(OrderListDTO dto) {
		this.dto = dto;
	}

	public String getDeliveryinfo() {
		return deliveryinfo;
	}

	public void setDeliveryinfo(String deliveryinfo) {
		this.deliveryinfo = deliveryinfo;
	}
	
}

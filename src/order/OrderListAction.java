package order;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.OrderListDTO;

public class OrderListAction implements Action, IbatisAware, SessionAware {
	public static SqlMapClient sqlMapper;
	Map sessionMap;
	

	public String execute() throws Exception {
		HashSet<OrderDTO> lists;
		OrderListDTO orderlist = new OrderListDTO();		
		lists = (HashSet<OrderDTO>)sessionMap.get("cartlist");
		
		
		for(OrderDTO list : lists)
		{
			orderlist.setUserid((String)sessionMap.get("memId"));
			orderlist.setOrdername(list.getName());
			orderlist.setSize_(list.getSize());
			orderlist.setAmount(list.getAmount());
			orderlist.setPrice(list.getPrice());
			orderlist.setDeliveryinfo("배송 정보가 없습니다.");
			sqlMapper.insert("orderListSQL.insertOrderList", orderlist);
		}

		return SUCCESS;
	}


	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public void setSession(Map arg0) {
		sessionMap=arg0;		
	}

}

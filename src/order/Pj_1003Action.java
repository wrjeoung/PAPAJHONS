package order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;

public class Pj_1003Action implements Action, SessionAware {
	
	Map sessionMap;
	
	private String _name;		// ��ǰ��
	private String _size;		// ������
	private String _cnt_opt;	// ����
	private String _price;		// ����
	private String addCount;
	
	Set<OrderDTO> lists;

	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String addOrderItem() {
		System.out.println("addOrderItem!");
		lists = (HashSet<OrderDTO>)sessionMap.get("cartlist");
		if(lists==null) {
			lists = new HashSet<OrderDTO>();
			sessionMap.put("cartlist", lists);
		}
		
		OrderDTO list = new OrderDTO();
		list.setAmount(_cnt_opt);
		list.setName(_name);
		list.setPrice(_price);
		list.setSize(_size);
		list.setAddcount(addCount);
		System.out.println("Pj_1003Action lists.contains(list) : "+lists.contains(list));		
		lists.add(list);
		
		for(OrderDTO li : lists) {
			System.out.println("pj_1003 amount : "+li.getAmount()+" name : "+li.getName()+" price : "+li.getPrice() +
					" size : "+li.getSize());
		}
		
		return SUCCESS;
	}

	
	public String getAddCount() {
		return addCount;
	}

	public void setAddCount(String addCount) {
		this.addCount = addCount;
	}

	public Set<OrderDTO> getLists() {
		return lists;
	}

	public String get_name() {
		return _name;
	}

	public void set_name(String _name) {
		this._name = _name;
	}

	public String get_size() {
		return _size;
	}

	public void set_size(String _size) {
		this._size = _size;
	}

	public String get_cnt_opt() {
		return _cnt_opt;
	}

	public void set_cnt_opt(String _cnt_opt) {
		this._cnt_opt = _cnt_opt;
	}

	public String get_price() {
		return _price;
	}

	public void set_price(String _price) {
		this._price = _price;
	}
	
	public void setSession(Map arg0) {
		sessionMap=arg0;
	}

}

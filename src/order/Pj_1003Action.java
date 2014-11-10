package order;

import java.util.ArrayList;
import java.util.HashMap;import java.util.HashSet;
import java.util.Iterator;import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;

public class Pj_1003Action implements Action, SessionAware {
	
	Map sessionMap;
	HashMap<String, OrderDTO> mapLists;
	private String _name;		// 제품명
	private String _size;		// 사이즈
	private String _cnt_opt;	// 수량
	private String _price;		// 가격
	private String needUpdate = null;
	private String completed;
	private String _randomString;

	private String addCount;	
	Set<OrderDTO> lists;


	public HashMap<String, OrderDTO> getMapLists() {
		return mapLists;
	}

	//ArrayList<OrderDTO> lists;

	public String get_randomString() {
		return _randomString;
	}

	public void set_randomString(String _randomString) {
		this._randomString = _randomString;
	}

	public String getCompleted() {
		return completed;
	}

	public void setCompleted(String completed) {
		this.completed = completed;
	}

	public String getNeedUpdate() {
		return needUpdate;
	}

	public void setNeedUpdate(String needUpdate) {
		this.needUpdate = needUpdate;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String addOrderItem() {
		System.out.println("addOrderItem!");
//		lists = (ArrayList<OrderDTO>)sessionMap.get("cartlist");
		lists = (HashSet<OrderDTO>)sessionMap.get("cartlist");
		if(lists==null) {
//			lists = new ArrayList<OrderDTO>();
			lists = new HashSet<OrderDTO>();
			sessionMap.put("cartlist", lists);
		}
		//mapLists = (HashMap<String, OrderDTO>)sessionMap.get("cartlist");
		
//		if(mapLists == null)
//		{
//			mapLists = new HashMap<String, OrderDTO>();
//			sessionMap.put("cartlist", mapLists);
//		}
		OrderDTO list = new OrderDTO();
		list.setAmount(_cnt_opt);
		list.setName(_name);
		list.setPrice(_price);
		list.setSize(_size);
		list.setAddCount(addCount);
		System.out.println("Pj_1003Action lists.contains(list) : "+lists.contains(list));		
		lists.add(list);
		
		//if(_randomString != null)
		//	mapLists.put(_randomString, list);
		
	
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

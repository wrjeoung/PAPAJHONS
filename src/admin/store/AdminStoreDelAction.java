package admin.store;

import admin.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

public class AdminStoreDelAction  extends ActionSupport implements IbatisAware{

	public static SqlMapClient sqlMapper;      //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String check=null;  // page 구분 변수
	private String store;
	private String storename;
	
	public String execute() throws Exception{
		System.out.println("execute() storename : " + getStorename());
		sqlMapper.delete("storeSQL.deleteStore",getStorename());
		
		return SUCCESS;
	}
	
	public String del() throws Exception{
		System.out.println("AdminStoreDelAction del() store : " + getStore());
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

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}
}

package papa.address;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

public class AddressAction extends  ActionSupport implements IbatisAware{
	
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private List<ZipAddress> list = new ArrayList<ZipAddress>();	 
	
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private String addressHtml = "";
	private String s_addr;
	private String dong;
	private String flag;
	

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getAddressHtml() {
		return addressHtml;
	}

	public void setAddressHtml(String addressHtml) {
		this.addressHtml = addressHtml;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String form() throws Exception {
		//��� ��.
		return SUCCESS;
	}

	// �Խ��� LIST �׼�
	public String execute() throws Exception {
		// ��� ���� ������ list�� �ִ´�. queryForObject // ����� �ϳ��϶�
		list = sqlMapper.queryForList("addressSQL.selectDong",dong); // ����� �������϶� return type : list
		StringBuffer str = new StringBuffer();
		
		for(ZipAddress addr : list)
		{
			String zip1 = addr.getZipcode().substring(0,3);
			String zip2 = addr.getZipcode().substring(4);
			String bunji = addr.getBunji() != null ? addr.getBunji() : "";
		
			String addrDisplay = addr.getSido()+" " + addr.getGugun()+" " + addr.getDong() + bunji;

			str.append("<li>");
			str.append("<a href='javascript:void();'>");
			str.append("<span id='addr' class='addr'> [" + zip1 + "-" + zip2 + "] " + addrDisplay +"</span>");
			str.append("<input type='hidden' name='zipCode'      class='zipCode'      value='"+ addr.getZipcode()+"' />");
			str.append("<input type='hidden' name='siName'       class='siName'       value='"+ addr.getSido()   +"' />");
			str.append("<input type='hidden' name='guName'       class='guName'       value='"+ addr.getGugun()  +"' />");
			str.append("<input type='hidden' name='dongName'       class='dongName'       value='"+ addr.getDong()  +"' />");
			str.append("<input type='hidden' name='bunJi'  class='bunJi'  value='"+ bunji +"' />");
			str.append("</a></li>");
		}
		addressHtml = str.toString();
		
		totalCount = list.size();
		return SUCCESS;
	}
	
	public List<ZipAddress> getList() {
		return list;
	}

	public void setList(List<ZipAddress> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}
	
	public void setS_addr(String s_addr){
		this.s_addr = s_addr;
	}
	
	public String getS_addr(){
		return s_addr;
	}

}







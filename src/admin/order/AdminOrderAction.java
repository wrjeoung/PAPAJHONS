package admin.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.OrderListDTO;
import db.StoreDTO;
import admin.IbatisAware;
import admin.pagingAction;

public class AdminOrderAction implements Action, IbatisAware {

	public static SqlMapClient sqlMapper;        //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private List<OrderListDTO> list = new ArrayList<OrderListDTO>();
	
	private int currentPage = 1;   //���� ������
	private int totalCount;        //�� �Խù��� ��
	private int blockCount = 10;   //�� �������� �Խù��� ��
	private int blockPage = 10;     //�� ȭ�鿡 ������ ������ ��
	private String pagingHtml;     //����¡�� ������ HTML
	private pagingAction page;     //����¡ Ŭ����
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HashMap params = new HashMap();
		params.put("deliverying", "��� �غ���");
		params.put("completed", "�����");
		
		// ��� ���� ������ list�� �ִ´�.   queryForObject(����� �ϳ��϶�) , queryForList(����� �������϶�)
		list = sqlMapper.queryForList("orderListSQL.selectAdminData",params);
		
		totalCount = list.size();  // ��ü �� ������ ���Ѵ�.
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "adminOrderAction"); // pagingAction ��ü ����
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����
		
		// ���� ���������� ������ ������ ���� ��ȣ ����
		int lastCount = totalCount;
		
		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����
		if(page.getEndCount() < totalCount)
		{
			lastCount = page.getEndCount() + 1;
		}
		
		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(page.getStartCount(), lastCount);
		
		/*
		for(Object a : list)
		{
			System.out.println(((OrderListDTO)a).getDeliveryinfo());
		}
		*/		
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

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public pagingAction getPage() {
		return page;
	}

	public void setPage(pagingAction page) {
		this.page = page;
	}
}

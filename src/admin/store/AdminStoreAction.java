package admin.store;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.StoreDTO;
import admin.IbatisAware;
import admin.pagingAction;

public class AdminStoreAction implements Action, IbatisAware {

	public static SqlMapClient sqlMapper;        //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private List<StoreDTO> list = new ArrayList<StoreDTO>();
	
	private int currentPage = 1;   //���� ������
	private int totalCount;        //�� �Խù��� ��
	private int blockCount = 5;   //�� �������� �Խù��� ��
	private int blockPage = 5;     //�� ȭ�鿡 ������ ������ ��
	private String pagingHtml;     //����¡�� ������ HTML
	private pagingAction page;     //����¡ Ŭ����
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		// ��� ���� ������ list�� �ִ´�.   queryForObject(����� �ϳ��϶�) , queryForList(����� �������϶�)
		list = sqlMapper.queryForList("storeSQL.selectAll");
		
		totalCount = list.size();  // ��ü �� ������ ���Ѵ�.
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "adminStoreAction"); // pagingAction ��ü ����
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
		
		for(Object a : list)
		{
			System.out.println(((StoreDTO)a).getStorename());
		}
		return SUCCESS;
	}

	public List<StoreDTO> getList() {
		return list;
	}

	public void setList(List<StoreDTO> list) {
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

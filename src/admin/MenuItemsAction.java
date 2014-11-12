package admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuDTO;

public class MenuItemsAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private List<MenuDTO> lists = new ArrayList<MenuDTO>();
	
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 		// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 		//����¡�� ������ HTML
	private pagingAction page; 		// ����¡ Ŭ����
	
	private String menuCategory;

	public String execute() throws Exception {
		lists = sqlMapper.queryForList("menuSQL.selectAll");
		
		totalCount=lists.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage,"menuItemsAction"); // pagingAction ��ü ����.
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.
		
		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		lists = lists.subList(page.getStartCount(), lastCount);
				
		return SUCCESS;
	}
	
	
	public String getMenuCategory() {
		return menuCategory;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public List<MenuDTO> getLists() {
		return lists;
	}
	
	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper=sqlMapper;
	}
}

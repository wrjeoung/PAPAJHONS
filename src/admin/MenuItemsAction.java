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

	public String execute() throws Exception {
		lists = sqlMapper.queryForList("menuSQL.selectAll");		
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "MenuItemsAction"); // pagingAction ��ü ����.
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.
		
		setTotalCount(lists.size());
		return SUCCESS;
	}

	
	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<MenuDTO> getLists() {
		return lists;
	}

	public void setLists(List<MenuDTO> lists) {
		this.lists = lists;
	}
	
	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper=sqlMapper;
	}
}

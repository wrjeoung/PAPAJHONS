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
	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 		// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 		//페이징을 구현한 HTML
	private pagingAction page; 		// 페이징 클래스

	public String execute() throws Exception {
		lists = sqlMapper.queryForList("menuSQL.selectAll");		
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "MenuItemsAction"); // pagingAction 객체 생성.
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.
		
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

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
	
	private String menuCategory;

	public String execute() throws Exception {
		lists = sqlMapper.queryForList("menuSQL.selectAll");
		
		totalCount=lists.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage,"menuItemsAction"); // pagingAction 객체 생성.
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.
		
		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
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

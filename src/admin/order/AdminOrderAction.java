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

	public static SqlMapClient sqlMapper;        //SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private List<OrderListDTO> list = new ArrayList<OrderListDTO>();
	
	private int currentPage = 1;   //현재 페이지
	private int totalCount;        //총 게시물의 수
	private int blockCount = 10;   //한 페이지의 게시물의 수
	private int blockPage = 10;     //한 화면에 보여줄 페이지 수
	private String pagingHtml;     //페이징을 구현한 HTML
	private pagingAction page;     //페이징 클래스
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HashMap params = new HashMap();
		params.put("deliverying", "배송 준비중");
		params.put("completed", "배송중");
		
		// 모든 글을 가져와 list에 넣는다.   queryForObject(결과가 하나일때) , queryForList(결과가 여러개일때)
		list = sqlMapper.queryForList("orderListSQL.selectAdminData",params);
		
		totalCount = list.size();  // 전체 글 갯수를 구한다.
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "adminOrderAction"); // pagingAction 객체 생성
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성
		
		// 현재 페이지에서 보여줄 마지막 글의 번호 설정
		int lastCount = totalCount;
		
		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정
		if(page.getEndCount() < totalCount)
		{
			lastCount = page.getEndCount() + 1;
		}
		
		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
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

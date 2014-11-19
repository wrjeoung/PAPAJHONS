package admin.storeevent;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import storeevent.board.storeeventVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class storeeventAdminAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<storeeventVO> list=new ArrayList<storeeventVO>();
	
	private int currentPage=1;
	private int totalCount;
	private int blockCount=5;	//*
	private int blockPage=5;
	private String pagingHtml;
	private pagingAction page;
	
	public storeeventAdminAction()throws Exception{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		list=sqlMapper.queryForList("store.selectAll");
		totalCount=list.size();
		page=new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml=page.getPagingHtml().toString();
		
		int lastCount=totalCount;
		
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount()+1;
		
		list=list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		storeeventAdminAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		storeeventAdminAction.sqlMapper = sqlMapper;
	}
	public List<storeeventVO> getList() {
		return list;
	}
	public void setList(List<storeeventVO> list) {
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

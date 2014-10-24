package gongji.board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class listAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<gongjiVO> list=new ArrayList<gongjiVO>();
	

	
	private int currentPage=1;	//현재페이지
	private int totalCount;	//총 게시물의 수
	private int blockCount=10;	//한 페이지의 게시물의 수
	private int blockPage=5;	//한 화면에 보여줄 페이지 수
	private String pagingHtml;	//페이징을 구현한 HTMl
	private pagingAction page;	//페이징 클래스
	
	
	
	//생성자
	public listAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	
	public String execute() throws Exception{
		
		list=sqlMapper.queryForList("gongji.selectAll");
		
		totalCount=list.size();	//전체 글의 개수
		page=new pagingAction(currentPage, totalCount, blockCount, blockPage);	//paingAction 객체 생성
		pagingHtml=page.getPagingHtml().toString();	//페이지 HTML 생성
		
		//현재 페이지에서 보여줄 마지막 글의 번호 설정
		int lastCount=totalCount;
		
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글보다 작으면 lastCount를 +1 번호로 설정
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount()+1;
		
		list=list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		listAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		listAction.sqlMapper = sqlMapper;
	}

	public List<gongjiVO> getList() {
		return list;
	}

	public void setList(List<gongjiVO> list) {
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

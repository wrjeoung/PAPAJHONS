package storeevent.board;

import gongji.board.pagingAction;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class getlistAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<storeeventVO> list=new ArrayList<>();
	private storeeventVO vo=new storeeventVO();
	
	private String subject;
	
	private String searchCondition;
	private String searchKeyword;
	
	private int currentPage=1;	//현재페이지
	private int totalCount;	//총 게시물의 수
	private int blockCount=5;	//한 페이지의 게시물의 수
	private int blockPage=5;	//한 화면에 보여줄 페이지 수
	private String pagingHtml;	//페이징을 구현한 HTMl
	private pagingAction page;	//페이징 클래스
	
	public getlistAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		vo.setSubject(getSubject());
		
		vo.setSearchCondition(getSearchCondition());
		vo.setSearchKeyword(getSearchKeyword());
		
		if (searchCondition == null) {
			searchKeyword = ""; // '%%' // 전체 검색 (100% Best)
		}
		
		if("subject".equals(searchCondition)){
			System.out.println("1");
			list=sqlMapper.queryForList("store.subjectList",searchKeyword);
			System.out.println("1-1");
			
			totalCount=list.size();	//전체 글의 개수
			page=new pagingAction(currentPage, totalCount, blockCount, blockPage);	//paingAction 객체 생성
			pagingHtml=page.getPagingHtml().toString();	//페이지 HTML 생성
			//현재 페이지에서 보여줄 마지막 글의 번호 설정
			int lastCount=totalCount;
			//현재 페이지의 마지막 글의 번호가 전체의 마지막 글보다 작으면 lastCount를 +1 번호로 설정
			if(page.getEndCount()<totalCount)
				lastCount=page.getEndCount()+1;
			list=list.subList(page.getStartCount(), lastCount);
		}
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		getlistAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		getlistAction.sqlMapper = sqlMapper;
	}
	public List<storeeventVO> getList() {
		return list;
	}
	public void setList(List<storeeventVO> list) {
		this.list = list;
	}
	public storeeventVO getVo() {
		return vo;
	}
	public void setVo(storeeventVO vo) {
		this.vo = vo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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

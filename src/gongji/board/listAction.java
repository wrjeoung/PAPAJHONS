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
	

	
	private int currentPage=1;	//����������
	private int totalCount;	//�� �Խù��� ��
	private int blockCount=10;	//�� �������� �Խù��� ��
	private int blockPage=5;	//�� ȭ�鿡 ������ ������ ��
	private String pagingHtml;	//����¡�� ������ HTMl
	private pagingAction page;	//����¡ Ŭ����
	
	
	
	//������
	public listAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	
	public String execute() throws Exception{
		
		list=sqlMapper.queryForList("gongji.selectAll");
		
		totalCount=list.size();	//��ü ���� ����
		page=new pagingAction(currentPage, totalCount, blockCount, blockPage);	//paingAction ��ü ����
		pagingHtml=page.getPagingHtml().toString();	//������ HTML ����
		
		//���� ���������� ������ ������ ���� ��ȣ ����
		int lastCount=totalCount;
		
		//���� �������� ������ ���� ��ȣ�� ��ü�� ������ �ۺ��� ������ lastCount�� +1 ��ȣ�� ����
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

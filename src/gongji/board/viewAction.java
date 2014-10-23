package gongji.board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;


public class viewAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private gongjiVO vo=new gongjiVO();

	private int currentPage;
	private int num;


	public viewAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	public String execute()throws Exception{
		vo.setNum(getNum());
		//��ȸ�� 1 ����
		sqlMapper.update("gongji.updateReadHit", vo);
		
		//�شܹ�ȣ�� ���� �����´�.
		vo=(gongjiVO)sqlMapper.queryForObject("gongji.selectOne", getNum());
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		viewAction.reader = reader;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public gongjiVO getVo() {
		return vo;
	}

	public void setVo(gongjiVO vo) {
		this.vo = vo;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
}

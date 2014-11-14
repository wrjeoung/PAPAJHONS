package nowevent.board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class viewAction extends ActionSupport implements IbatisAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private noweventVO vo=new noweventVO();
	
	private int currentPage;
	private int num;
	private String file_savname;
	
	/*public viewAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}*/
	public String execute() throws Exception{
		vo.setNum(getNum());
		//조회수 1증가
		sqlMapper.update("nowevent.updateReadHit",vo);
		
		//해당 번호의 글을 가져온다.
		vo=(noweventVO)sqlMapper.queryForObject("nowevent.selectOne", getNum());
		
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		viewAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		viewAction.sqlMapper = sqlMapper;
	}
	public noweventVO getVo() {
		return vo;
	}
	public void setVo(noweventVO vo) {
		this.vo = vo;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper=sqlMapper;
	}
}

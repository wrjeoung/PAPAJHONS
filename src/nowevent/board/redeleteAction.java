package nowevent.board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class redeleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private reVO revo;
	private int num1;
	
	public redeleteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		revo=new reVO();
		revo.setNum1(getNum1());
		sqlMapper.update("reple.deleteRe", getNum1());
		
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		redeleteAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		redeleteAction.sqlMapper = sqlMapper;
	}
	public reVO getRevo() {
		return revo;
	}
	public void setRevo(reVO revo) {
		this.revo = revo;
	}
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	
	
}

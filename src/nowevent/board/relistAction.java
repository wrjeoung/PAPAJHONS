package nowevent.board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class relistAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int num;
	private List<reVO> list2=new ArrayList<reVO>();
	private reVO vo=new reVO();
	
	public relistAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		vo.setNum(getNum());
		list2=sqlMapper.queryForList("reple.selectRe", getNum());
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		relistAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		relistAction.sqlMapper = sqlMapper;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public List<reVO> getList2() {
		return list2;
	}
	public void setList2(List<reVO> list2) {
		this.list2 = list2;
	}
	
	
}

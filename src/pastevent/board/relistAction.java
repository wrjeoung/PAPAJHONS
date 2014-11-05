package pastevent.board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import nowevent.board.reVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;


public class relistAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int num;
	private List<reVO> list3=new ArrayList<reVO>();
	private reVO vo2=new reVO();
	
	public relistAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		vo2.setNum(getNum());
		list3=sqlMapper.queryForList("reple.selectRe", getNum());
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
	public List<reVO> getList3() {
		return list3;
	}
	public void setList3(List<reVO> list3) {
		this.list3 = list3;
	}
	public reVO getVo2() {
		return vo2;
	}
	public void setVo2(reVO vo2) {
		this.vo2 = vo2;
	}

}

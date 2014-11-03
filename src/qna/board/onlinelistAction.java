package qna.board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class onlinelistAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private qnaVO vo=new qnaVO();
	private String qmenu;
	
	private List<qnaVO> list2=new ArrayList<qnaVO>();
	
	public onlinelistAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		vo.setQmenu(getQmenu());
		list2=sqlMapper.queryForList("qna.selectOnline", getQmenu());
		
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		onlinelistAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		onlinelistAction.sqlMapper = sqlMapper;
	}
	public qnaVO getVo() {
		return vo;
	}
	public void setVo(qnaVO vo) {
		this.vo = vo;
	}
	public String getQmenu() {
		return qmenu;
	}
	public void setQmenu(String qmenu) {
		this.qmenu = qmenu;
	}
	public List<qnaVO> getList2() {
		return list2;
	}
	public void setList2(List<qnaVO> list2) {
		this.list2 = list2;
	}
}

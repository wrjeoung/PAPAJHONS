package qna.board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class homelistAction extends ActionSupport implements IbatisAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private qnaVO vo=new qnaVO();
	private String qmenu;
	
	private List<qnaVO> list5=new ArrayList<qnaVO>();
	
	/*public homelistAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}*/
	public String execute()throws Exception{
		vo.setQmenu(getQmenu());
		list5=sqlMapper.queryForList("qna.selectHome", getQmenu());
		
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		homelistAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		homelistAction.sqlMapper = sqlMapper;
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
	public List<qnaVO> getList5() {
		return list5;
	}
	public void setList5(List<qnaVO> list5) {
		this.list5 = list5;
	}
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper=sqlMapper;
	}

}

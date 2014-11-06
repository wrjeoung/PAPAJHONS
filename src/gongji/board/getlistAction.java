package gongji.board;

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
	
	private List<gongjiVO> list=new ArrayList<gongjiVO>();
	
	private gongjiVO vo=new gongjiVO();
	private String subject;
	private String content;
	
	private String searchCondition;
	private String searchKeyword;
	
	public getlistAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception{
		vo.setSubject(getSubject());
		
		vo.setContent(getContent());
		
		vo.setSearchCondition(getSearchCondition());
		vo.setSearchKeyword(getSearchKeyword());
		
		if ("subject".equals(searchCondition)) {
			System.out.println("----------------2");
			list=sqlMapper.queryForList("gongji.subjectList", getSubject());
			
		} else if("content".equals(searchCondition)) {
			list=sqlMapper.queryForList("gongji.contentList", getContent());
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
	public List<gongjiVO> getList() {
		return list;
	}
	public void setList(List<gongjiVO> list) {
		this.list = list;
	}
	public gongjiVO getVo() {
		return vo;
	}
	public void setVo(gongjiVO vo) {
		this.vo = vo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	
}

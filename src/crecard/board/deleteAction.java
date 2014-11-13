package crecard.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.classfile.Field;

public class deleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private crecardVO vo;
	private String fileUploadPath="D:\\workspace\\PAPA_Project\\WebContent\\ccfile\\";
	private int num;
	
	public deleteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		vo=new crecardVO();
		vo=(crecardVO)sqlMapper.queryForObject("crecard.selectOne", getNum());
		File deleteFile=new File(fileUploadPath+vo.getFile_savname());
		deleteFile.delete();
		vo.setNum(getNum());
		sqlMapper.update("crecard.deleteBoard", vo);
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		deleteAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		deleteAction.sqlMapper = sqlMapper;
	}
	public crecardVO getVo() {
		return vo;
	}
	public void setVo(crecardVO vo) {
		this.vo = vo;
	}
	public String getFileUploadPath() {
		return fileUploadPath;
	}
	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}

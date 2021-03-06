package storeevent.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class deleteAction extends ActionSupport implements IbatisAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private storeeventVO vo;
	
	private int currentPage;
	private String fileUploadPath="\\\\192.168.10.77\\Imageupload\\";
	
	private int num;
	
	/*public deleteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}*/
	public String execute()throws Exception{
		vo=new storeeventVO();
		vo=(storeeventVO)sqlMapper.queryForObject("store.selectOne", getNum());
		
		//�������ϻ���
		File deleteFile=new File(fileUploadPath+vo.getFile_savname());
		deleteFile.delete();
		
		//������ �׸� ����
		vo.setNum(getNum());
		
		//���� ���� ����
		sqlMapper.update("store.deleteBoard", vo);
		
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
	public storeeventVO getVo() {
		return vo;
	}
	public void setVo(storeeventVO vo) {
		this.vo = vo;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper=sqlMapper;
	}
}

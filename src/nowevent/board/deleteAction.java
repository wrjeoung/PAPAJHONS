package nowevent.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class deleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private noweventVO vo;
	
	private int currentPage;
	private String fileUploadPath="D:\\workspace\\PAPA_Project\\WebContent\\save2\\";
	
	private int num;
	
	public deleteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		vo=new noweventVO();
		vo=(noweventVO)sqlMapper.queryForObject("nowevent.selectOne", getNum());
		
		//서버파일삭제
		File deleteFile=new File(fileUploadPath+vo.getFile_savname());
		File deleteFile2=new File(fileUploadPath+vo.getFile_savname2());
		deleteFile.delete();
		deleteFile2.delete();
		
		//삭제할 항목 설정
		vo.setNum(getNum());
		
		//삭제 쿼리 수행
		sqlMapper.update("nowevent.deleteBoard", vo);
		
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

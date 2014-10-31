package specialevent.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class writeAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private specialeventVO vo;
	
	private int num;
	Calendar today=Calendar.getInstance();

	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="D:\\workspace\\papa\\WebContent\\save5\\";
	
	public writeAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo=new specialeventVO();
		vo.setReg_date(today.getTime());
		
		sqlMapper.insert("special.insertSpecial",vo);
		
		if(getUpload()!=null){
			vo=(specialeventVO)sqlMapper.queryForObject("special.selectLastNo");
			
			String file_name="file_"+vo.getNum();
			String file_ext=getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,
					getUploadFileName().length());
			
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			vo.setNum(vo.getNum());
			vo.setFile_orgname(getUploadFileName());
			vo.setFile_savname(file_name+"."+file_ext);
			sqlMapper.update("special.updateFile", vo);
		}
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		writeAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		writeAction.sqlMapper = sqlMapper;
	}
	public specialeventVO getVo() {
		return vo;
	}
	public void setVo(specialeventVO vo) {
		this.vo = vo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getFileUploadPath() {
		return fileUploadPath;
	}
	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
}

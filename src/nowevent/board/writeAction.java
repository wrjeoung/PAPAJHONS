package nowevent.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class writeAction extends ActionSupport implements IbatisAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private noweventVO vo;
	
	private int num;
	private String subject;
	
	private String day;
	
	Calendar today=Calendar.getInstance();
	
	private String file_orgName;
	private String file_savName;
	
	private String file_orgName2;
	private String file_savName2;
	
	private File upload;
	private File upload2;
	
	private String uploadContentType;
	private String uploadFileName;
	
	private String upload2ContentType;
	private String upload2FileName;
	
	private String fileUploadPath="\\\\192.168.10.77\\Imageupload\\";
	
	/*public writeAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}*/
	public String form()throws Exception{
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo=new noweventVO();
		vo.setSubject(getSubject());
		vo.setReg_date(today.getTime());
		vo.setDay(getDay());
		
		sqlMapper.insert("nowevent.insertNowevent", vo);
		
		if(getUpload()!=null){

			vo=(noweventVO)sqlMapper.queryForObject("nowevent.selectLastNo");
			
			//실제서버에 저장될 파일 이름과 확장자 설정
			String file_name="file_"+vo.getNum();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());
			
			//서버에 파일 저장
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정
			vo.setNum(vo.getNum());
			vo.setFile_orgname(getUploadFileName());
			vo.setFile_savname(file_name+"."+file_ext);
			sqlMapper.update("nowevent.updateFile", vo);
		}
		if(getUpload2()!=null){

			vo=(noweventVO)sqlMapper.queryForObject("nowevent.selectLastNo");
			String file_name="file2_"+vo.getNum();
			System.out.println(file_name);
			String file_ext=getUpload2FileName().substring(
					getUpload2FileName().lastIndexOf('.')+1,
					getUpload2FileName().length());
			System.out.println(file_ext);
			//서버에 파일 저장
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			
			FileUtils.copyFile(getUpload2(), destFile);
		
			//파일 정보 파라미터 설정
			vo.setNum(vo.getNum());
			vo.setFile_orgname2(getUpload2FileName());
			vo.setFile_savname2(file_name+"."+file_ext);
			sqlMapper.update("nowevent.updateFile2", vo);
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
	public noweventVO getVo() {
		return vo;
	}
	public void setVo(noweventVO vo) {
		this.vo = vo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	public String getFile_orgName() {
		return file_orgName;
	}
	public void setFile_orgName(String file_orgName) {
		this.file_orgName = file_orgName;
	}
	public String getFile_savName() {
		return file_savName;
	}
	public void setFile_savName(String file_savName) {
		this.file_savName = file_savName;
	}
	public String getFile_orgName2() {
		return file_orgName2;
	}
	public void setFile_orgName2(String file_orgName2) {
		this.file_orgName2 = file_orgName2;
	}
	public String getFile_savName2() {
		return file_savName2;
	}
	public void setFile_savName2(String file_savName2) {
		this.file_savName2 = file_savName2;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public File getUpload2() {
		return upload2;
	}
	public void setUpload2(File upload2) {
		this.upload2 = upload2;
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
	public String getUpload2ContentType() {
		return upload2ContentType;
	}
	public void setUpload2ContentType(String upload2ContentType) {
		this.upload2ContentType = upload2ContentType;
	}
	public String getUpload2FileName() {
		return upload2FileName;
	}
	public void setUpload2FileName(String upload2FileName) {
		this.upload2FileName = upload2FileName;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper=sqlMapper;
	}
	
}

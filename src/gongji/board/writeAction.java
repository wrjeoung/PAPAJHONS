package gongji.board;

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
	
	private gongjiVO vo;
	
	private int num;
	private String subject;
	Calendar today=Calendar.getInstance();
	private String content;
	
	private String file_orgName;
	private String file_savName;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	

	private String fileUploadPath="D:\\workspace\\papa\\WebContent\\save\\";
	//생성자
	public writeAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		vo=new gongjiVO();
		vo.setSubject(getSubject());
		vo.setContent(getContent());
		vo.setReg_date(today.getTime());
		
		sqlMapper.insert("gongji.insertGongji", vo);
		System.out.println("0");
		
		if(getUpload()!=null){
		System.out.println("1");
			vo=(gongjiVO)sqlMapper.queryForObject("gongji.selectLastNo");
			
			//실제서버에 저장될 파일 이름과 확장자 설정
			String file_name="file_"+vo.getNum();
			String file_ext=getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1,
					getUploadFileName().length());
			//서버에 파일 저장
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정
			vo.setNum(vo.getNum());
			vo.setFile_orgname(getUploadFileName());
			vo.setFile_savname(file_name+"."+file_ext);
			sqlMapper.update("gongji.updateFile", vo);
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

	public gongjiVO getVo() {
		return vo;
	}

	public void setVo(gongjiVO vo) {
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

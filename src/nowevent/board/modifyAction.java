package nowevent.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;




import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class modifyAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	private noweventVO vo=new noweventVO();
	
	private int num;
	private String subject;
	
	private String day;
	
	private String old_file;
	private String old_file2;
	
	private String file_savname;
	private String file_savname2;
	
	private File upload;
	private File upload2;
	
	private String uploadContentType;
	private String uploadFileName;
	
	private String upload2ContentType;
	private String upload2FileName;
	
	private String fileUploadPath="D:\\workspace\\PAPA_Project\\WebContent\\save2\\";
	
	public modifyAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		vo.setNum(getNum());
		vo=(noweventVO)sqlMapper.queryForObject("nowevent.selectOne",getNum());
		
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo.setNum(getNum());
		vo.setSubject(getSubject());
		vo.setDay(getDay());
		sqlMapper.update("nowevent.updateBoard", vo);
		
		//파일수정
		if(getUpload()!=null){
			String file_name="file_"+getNum();
			String file_ext=getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			
			File deleteFile=new File(fileUploadPath+getOld_file());
			deleteFile.delete();
			
			//새파일 업로드
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일정보 파라미터 설정
			vo.setFile_orgname(getUploadFileName());
			vo.setFile_savname(file_name+"."+file_ext);
			
			sqlMapper.update("nowevent.updateFile", vo);
		}
		//파일 수정2
		if(getUpload2()!=null){
			String file_name2="file2_"+getNum();
			String file_ext2=getUpload2FileName().substring(getUpload2FileName().lastIndexOf('.')+1,getUpload2FileName().length());
			
			File deleteFile2=new File(fileUploadPath+getOld_file2());
			deleteFile2.delete();
			
			//새파일 업로드
			File destFile=new File(fileUploadPath+file_name2+"."+file_ext2);
			FileUtils.copyFile(getUpload2(), destFile);
			
			//파일정보 파라미터 설정
			vo.setFile_orgname2(getUpload2FileName());
			vo.setFile_savname2(file_name2+"."+file_ext2);
			
			sqlMapper.update("nowevent.updateFile2",vo);
		}
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		modifyAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		modifyAction.sqlMapper = sqlMapper;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	public String getOld_file() {
		return old_file;
	}
	public void setOld_file(String old_file) {
		this.old_file = old_file;
	}
	public String getOld_file2() {
		return old_file2;
	}
	public void setOld_file2(String old_file2) {
		this.old_file2 = old_file2;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public String getFile_savname2() {
		return file_savname2;
	}
	public void setFile_savname2(String file_savname2) {
		this.file_savname2 = file_savname2;
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
	public String getFileUploadPath() {
		return fileUploadPath;
	}
	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
}

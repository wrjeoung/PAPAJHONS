package crecard.board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class modifyAction extends ActionSupport implements IbatisAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private crecardVO vo=new crecardVO();
	
	private int num;
	private String subject;
	private String content;
	private String old_file;
	private String file_savname;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="\\\\192.168.10.77\\Imageupload\\";
	
	/*public modifyAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}*/
	public String form()throws Exception{
		vo.setNum(getNum());
		vo=(crecardVO)sqlMapper.queryForObject("crecard.selectOne", getNum());
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo.setNum(getNum());
		vo.setSubject(getSubject());
		vo.setContent(getContent());
		
		sqlMapper.update("crecard.updateBoard",vo);
		
		if(getUpload()!=null){
			String file_name="file_"+getNum();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
					
			File deleteFile=new File(fileUploadPath+getOld_file());
			deleteFile.delete();
					
			//������ ���ε�
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
					
			//�������� �Ķ���� ����
			vo.setFile_orgname(getUploadFileName());
			vo.setFile_savname(file_name+"."+file_ext);
					
			sqlMapper.update("crecard.updateFile", vo);
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
	public crecardVO getVo() {
		return vo;
	}
	public void setVo(crecardVO vo) {
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
	public String getOld_file() {
		return old_file;
	}
	public void setOld_file(String old_file) {
		this.old_file = old_file;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
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
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper=sqlMapper;
	}
	
}

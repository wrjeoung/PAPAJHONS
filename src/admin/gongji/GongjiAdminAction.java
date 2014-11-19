package admin.gongji;

import gongji.board.gongjiVO;










import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import admin.IbatisAware;
import admin.pagingAction;

public class GongjiAdminAction extends ActionSupport implements IbatisAware,Preparable, ModelDriven {
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private List<gongjiVO> list=new ArrayList<gongjiVO>();
	private gongjiVO data;
	private int currentPage=1;	//����������
	private int totalCount;	//�� �Խù��� ��
	private int blockCount=5;	//�� �������� �Խù��� ��
	private int blockPage=5;	//�� ȭ�鿡 ������ ������ ��
	private String pagingHtml;	//����¡�� ������ HTMl
	private pagingAction page;	//����¡ Ŭ����
	private int num;
	Calendar today=Calendar.getInstance();
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "\\\\192.168.10.77\\Imageupload\\"; //���ε� ���.
	private String old_file;
	
	public int getNum() {
		return num;
	}

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
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

	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		list=sqlMapper.queryForList("gongji.selectAll");
		
		totalCount=list.size();	//��ü ���� ����
		page=new pagingAction(currentPage, totalCount, blockCount, blockPage, "adminGongjiAction");	//paingAction ��ü ��
		pagingHtml=page.getPagingHtml().toString();	//������ HTML ��
		
		//���� ���������� ������ ������ ���� ��ȣ ����
		int lastCount=totalCount;
		
		//���� �������� ������ ���� ��ȣ�� ��ü�� ������ �ۺ��� ������ lastCount�� +1 ��ȣ�� ����
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount()+1;
		
		list=list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public String write() throws Exception {
		data.setReg_date(today.getTime());
		sqlMapper.insert("gongji.insertGongji", data);
		
		if(getUpload()!=null){
			data=(gongjiVO)sqlMapper.queryForObject("gongji.selectLastNo");
			
			//���������� ����� ���� �̸��� Ȯ���� ����
			String file_name="file_"+data.getNum();
			String file_ext=getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1,
					getUploadFileName().length());
			//������ ���� ����
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//���� ���� �Ķ���� ����
			data.setFile_orgname(getUploadFileName());
			data.setFile_savname(file_name+"."+file_ext);
			sqlMapper.update("gongji.updateFile", data);
		}
		return SUCCESS;
	}
	
	public String modify() throws Exception{
		
		data = (gongjiVO)sqlMapper.queryForObject("gongji.selectOne",num);
		if(data == null)
		{
			data = new gongjiVO();
			data.setNum(1);
			data.setSubject("�������������� ���� ����ȳ�");
			data.setReadhit(2);
			data.setContent("�?��, �ȳ��ϼ���. �ѱ������������Դϴ�.���������������� 2014�� 10�� 29�� ���� ������ ������ 178-16���� 2������ �����Ͽ����� �˷��帳�ϴ�."
			+"���Ӱ� ź���� ���������������� ���� ��ɰ� ��� ��Ź �帳�ϴ�."
			+"�������� ���� �ڼ��� ������ �Ʒ��� �����ϴ�."
			+"��ȭ��ȣ : 02-3275-0955	�����ּ� : ����Ư���� ������ ������ 178-16 �����ð� : ���� 11:00 ~ ���� 10:30 ����Ÿ�� : Delivery �������� : �����Ұ� ���� :11"
			);
			data.setFile_orgname("test.jpg");
		}
		return SUCCESS;
	}
	
	public String modifyPro() throws Exception {
		// �ϴ� �׸� �����Ѵ�.
		sqlMapper.update("gongji.updateBoard", data);
		// ������ ������ ���ε� �Ǿ�ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
		if (getUpload() != null) {
			
			//���� ������ ����� ���� �̸��� Ȯ���� ����.
			String file_name = "file_" + data.getNum();
		           String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
			//���� ���� ����
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			//�� ���� ���ε�
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//���� ���� �Ķ���� ����.
			data.setFile_orgname(getUploadFileName());
			data.setFile_savname(file_name + "." + file_ext);
			
			//���� ���� ������Ʈ.
			sqlMapper.update("gongji.updateFile", data);
		}
		
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		data=(gongjiVO)sqlMapper.queryForObject("gongji.selectOne", getNum());
		
		//�������ϻ���
		File deleteFile = new File(fileUploadPath + data.getFile_savname());
		deleteFile.delete();
		
		//���� ���� ����
		sqlMapper.update("gongji.deleteBoard", data);
		return SUCCESS;
	}

	public List<gongjiVO> getList() {
		return list;
	}

	public void setList(List<gongjiVO> list) {
		this.list = list;
	}	
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public String getPagingHtml() {
		return pagingHtml;
	}
	
	public void setNum(int num) {
		this.num = num;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public gongjiVO getData() {
		return data;
	}

	public void setData(gongjiVO data) {
		this.data = data;
	}	
	
	public Object getModel() {
		return data;
	}

	public void prepare() throws Exception {
		data = new gongjiVO();
	}		
	
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}
	
}

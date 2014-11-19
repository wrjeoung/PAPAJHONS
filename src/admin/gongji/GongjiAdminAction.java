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
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private List<gongjiVO> list=new ArrayList<gongjiVO>();
	private gongjiVO data;
	private int currentPage=1;	//현재페이지
	private int totalCount;	//총 게시물의 수
	private int blockCount=5;	//한 페이지의 게시물의 수
	private int blockPage=5;	//한 화면에 보여줄 페이지 수
	private String pagingHtml;	//페이징을 구현한 HTMl
	private pagingAction page;	//페이징 클래스
	private int num;
	Calendar today=Calendar.getInstance();
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "\\\\192.168.10.77\\Imageupload\\"; //업로드 경로.
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
		
		totalCount=list.size();	//전체 글의 개수
		page=new pagingAction(currentPage, totalCount, blockCount, blockPage, "adminGongjiAction");	//paingAction 객체 생성
		pagingHtml=page.getPagingHtml().toString();	//페이지 HTML 생성
		
		//현재 페이지에서 보여줄 마지막 글의 번호 설정
		int lastCount=totalCount;
		
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글보다 작으면 lastCount를 +1 번호로 설정
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
			
			//실제서버에 저장될 파일 이름과 확장자 설정
			String file_name="file_"+data.getNum();
			String file_ext=getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1,
					getUploadFileName().length());
			//서버에 파일 저장
			File destFile=new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정
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
			data.setSubject("파파존스마포점 매장 이전안내");
			data.setReadhit(2);
			data.setContent("고객님, 안녕하세요. 한국파파존스㈜입니다.파파존스마포점이 2014년 10월 29일 서울 마포구 염리동 178-16번지 2층으로 이전하였음을 알려드립니다."
			+"새롭게 탄생한 파파존스마포점에 많은 관심과 사랑 부탁 드립니다."
			+"마포점에 관한 자세한 정보는 아래와 같습니다."
			+"전화번호 : 02-3275-0955	매장주소 : 서울특별시 마포구 염리동 178-16 영업시간 : 오전 11:00 ~ 오후 10:30 매장타입 : Delivery 주차여부 : 주차불가 지도 :11"
			);
			data.setFile_orgname("test.jpg");
		}
		return SUCCESS;
	}
	
	public String modifyPro() throws Exception {
		// 일단 항목만 수정한다.
		sqlMapper.update("gongji.updateBoard", data);
		// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
		if (getUpload() != null) {
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + data.getNum();
		           String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
			//이전 파일 삭제
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			//새 파일 업로드
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정.
			data.setFile_orgname(getUploadFileName());
			data.setFile_savname(file_name + "." + file_ext);
			
			//파일 정보 업데이트.
			sqlMapper.update("gongji.updateFile", data);
		}
		
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		data=(gongjiVO)sqlMapper.queryForObject("gongji.selectOne", getNum());
		
		//서버파일삭제
		File deleteFile = new File(fileUploadPath + data.getFile_savname());
		deleteFile.delete();
		
		//삭제 쿼리 수행
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

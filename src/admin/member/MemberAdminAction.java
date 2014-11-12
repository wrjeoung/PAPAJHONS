package admin.member;

import java.util.ArrayList;
import java.util.List;

import admin.IbatisAware;
import admin.pagingAction;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import papa.member.MemberData;

public class MemberAdminAction extends ActionSupport implements IbatisAware,Preparable, ModelDriven {
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private List<MemberData> list = new ArrayList<MemberData>();
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private pagingAction page; 	// ����¡ Ŭ����
	private String id;
	private MemberData data;
	
	public MemberData getData() {
		return data;
	}

	public void setData(MemberData data) {
		this.data = data;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public List<MemberData> getList() {
		return list;
	}

	public String modify() throws Exception {
		data = (MemberData) sqlMapper.queryForObject("memberSQL.selectOne",id);
		
		return SUCCESS;
	}
	
	public String modifyPro() throws Exception {
		sqlMapper.update("memberSQL.updateMemberByadmin", data);
		return SUCCESS;
	}	
	
	public int getTotalCount() {
		return totalCount;
	}

	public String execute() throws Exception {
		list = sqlMapper.queryForList("memberSQL.selectAll");
		
		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "adminMemberAction"); // pagingAction ��ü ����.
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(page.getStartCount(), lastCount);		
				
		return SUCCESS;
	}	
	
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

	@Override
	public Object getModel() {
		
		return data;
	}

	@Override
	public void prepare() throws Exception {
		data = new MemberData();
	}

}

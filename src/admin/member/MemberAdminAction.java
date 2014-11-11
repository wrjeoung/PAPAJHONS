package admin.member;

import java.util.ArrayList;
import java.util.List;

import admin.IbatisAware;
import admin.pagingAction;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import papa.member.MemberData;

public class MemberAdminAction extends ActionSupport implements IbatisAware {
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private List<MemberData> list = new ArrayList<MemberData>();
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private pagingAction page; 	// ����¡ Ŭ����
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public List<MemberData> getList() {
		return list;
	}

	public String form() throws Exception {
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

}

package gongji.board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class IbatisInterceptor implements Interceptor{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	@Override
	public void init() {
		try {
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
			reader.close();					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // sqlMapConfig.xml 파일의 설정내용을 가져온다.
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Object action = invocation.getAction();
		if(action instanceof IbatisAware)
		{
			IbatisAware ibatisAware = (IbatisAware)action;
			ibatisAware.setIbatis(sqlMapper);
		}
		return invocation.invoke(); 
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}

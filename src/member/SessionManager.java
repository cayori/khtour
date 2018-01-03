package member;

import java.io.IOException;
import java.io.Reader;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class SessionManager extends ActionSupport implements HttpSessionListener {//세션의 생성과 만료시기를 감지하는 클래스

	private static Reader reader;
	private static SqlMapClient sqlMapper;

	public SessionManager() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// 세션 만료 될 때 로그아웃 처리
		try {
			// 만료된 세션아이디를 파라미터클래스로 하여 ch값을 2로 업데이트
			sqlMapper.update("updatechoff", arg0.getSession().getAttribute("id"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

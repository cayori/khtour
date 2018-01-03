package member;

import java.io.IOException;
import java.io.Reader;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class SessionManager extends ActionSupport implements HttpSessionListener {//������ ������ ����ñ⸦ �����ϴ� Ŭ����

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
		// ���� ���� �� �� �α׾ƿ� ó��
		try {
			// ����� ���Ǿ��̵� �Ķ����Ŭ������ �Ͽ� ch���� 2�� ������Ʈ
			sqlMapper.update("updatechoff", arg0.getSession().getAttribute("id"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AppOut extends ActionSupport {

	private static Reader reader;
	private static SqlMapClient sqlMapper;

	List idlist = new ArrayList();

	public AppOut() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public void appout() throws Exception {//�ֱ������� ������ ����� ���̵� �ִ��� ����
		ActionContext context = ActionContext.getContext();
		Map<String, String> app = context.getApplication();
		
		

		List id = sqlMapper.queryForList("outid");//������ ����� ���̵� ������
		
		if(id!=null){//������ ����� ���̵� �ִٸ�
			Iterator i = id.iterator();
			while(i.hasNext()){
				String a = (String)i.next();
				app.remove(a);
				sqlMapper.update("chout", a);
				app.remove("error");
			}//chĮ���� ��α��λ��·� �����Ѵ�
		}

		}

}

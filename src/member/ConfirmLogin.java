package member;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class ConfirmLogin implements Interceptor {

	// �α��� ���� ����ڿ��� �ߺ� �α��� �õ��� �˸�â�� ����ִ� ���ͼ��� Ŭ����

	public void init() {

	}

	public void destroy() {

	}

	// �ֱ������� ����Ǵ� �Լ����� ������ action�� Ÿ�� ���ͼ������·� �� �޼ҵ带 ���� ��� �������ش�(�ߺ� �α��� �õ��� �ִ���)
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		Map<String, String> app = context.getApplication();

		String check = (String) app.get("error");

		if (check != null) {//error��� Ű�� ���� ���ø����̼� ���� �ʰ�ü�� �ִٸ�
			if (check.equals(app.get(app.get("error")))) {//���� �α��� ���� ȸ���� ���̵�� �� error�� ���̵��� �����ϴٸ� ���â�� ����ش� 
				//���ø����̼� ������ error��� Ű�� ����ٴ� ���� �α����� ȸ���� ���̵� Ű�� ���� ���� �������ִٴ� ��. �� ������Ʈ �ͼ����� �߻����� �ʴ´�.
				app.remove("error");
				return "input";
			}
		}
		return invocation.invoke();
	}

}

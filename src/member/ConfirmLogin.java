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

	// 로그인 중인 사용자에게 중복 로그인 시도시 알림창을 띄워주는 인터셉터 클래스

	public void init() {

	}

	public void destroy() {

	}

	// 주기적으로 실행되는 함수에서 보내는 action을 타고 인터셉터형태로 이 메소드를 통해 계속 감지해준다(중복 로그인 시도가 있는지)
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		Map<String, String> app = context.getApplication();

		String check = (String) app.get("error");

		if (check != null) {//error라는 키를 가진 어플리케이션 영역 맵객체가 있다면
			if (check.equals(app.get(app.get("error")))) {//현재 로그인 중인 회원의 아이디와 맵 error의 아이디값이 동일하다면 경고창을 띄워준다 
				//어플리케이션 영역에 error라는 키가 생겼다는 것은 로그인한 회원의 아이디를 키로 갖는 맵이 생성되있다는 것. 즉 널포인트 익셉션은 발생하지 않는다.
				app.remove("error");
				return "input";
			}
		}
		return invocation.invoke();
	}

}

package member;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginCheck implements Interceptor {

	public void init() {

	}

	public void destroy() {

	}

	public String intercept(ActionInvocation invocation) throws Exception {
		 ActionContext context = invocation.getInvocationContext();
	        Map session = context.getSession();
	        
	        if (session.get("id") == null) {//로그인을 시도한 아이디와 동일한 아이디로 접속중인지 확인하는 인터셉터
	            return Action.ERROR;
	        }
	        return invocation.invoke();
	    }

}

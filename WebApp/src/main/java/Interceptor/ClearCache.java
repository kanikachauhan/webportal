package Interceptor;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ClearCache extends AbstractInterceptor implements StrutsStatics {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		 final ActionContext context = invocation.getInvocationContext();
	        HttpServletResponse response = (HttpServletResponse)context.get(StrutsStatics.HTTP_RESPONSE);
	        if(response!=null){
	            response.setHeader("Cache-control", "no-cache, no-store");
	            response.setHeader("Pragma", "no-cache");
	            response.setHeader("Expires", "-1");

	        }

	        return invocation.invoke();
	}

}

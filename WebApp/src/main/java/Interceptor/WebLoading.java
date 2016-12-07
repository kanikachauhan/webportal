package Interceptor;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import Action.SendAction;

import java.net.*;
import java.util.Map;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

public class WebLoading extends AbstractInterceptor{
	String result;
	ActionContext context;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		try
		{
			Map<String, Object> session = invocation.getInvocationContext().getSession();
			Boolean loggedin = (Boolean)session.get("loggedin");
			if(loggedin==true)
				return "success";
			else
				return "klogin";
		}	 
		catch(Exception e)
		{
			e.printStackTrace();
			return "klogin";
		}
	}
}

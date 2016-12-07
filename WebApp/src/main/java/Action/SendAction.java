package Action;
import javax.servlet.ServletContext;
import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


import Dao.MacAddressDao;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.net.*;
public class SendAction extends ActionSupport implements ModelDriven{
	ApplicationContext context;
	@Autowired
	static MacAddressDao macAddressDao;
	static ActionContext ctx = ActionContext.getContext();
	static HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	static HttpServletResponse response = ServletActionContext.getResponse();
	public  HttpSession session=request.getSession();
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	public String execute(){
		session.setAttribute("loggedin", false);
		System.out.println(session.getAttribute("loggedin"));
		return LOGIN;
	}
	public String checklogin(){
		return ERROR;	
	}
	public String homepage(){
		session.setAttribute("loggedin", false);
		System.out.println(session.getAttribute("loggedin"));
		return SUCCESS;
	}
	public String contactus(){
		return SUCCESS;
	}
}

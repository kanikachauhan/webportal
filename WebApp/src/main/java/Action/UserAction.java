package Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Dao.CustomerDao;
import Dao.LoginDao;
import Model.Customer;
import Model.Network;
import Model.NetworkJoin;
import Model.Product;

public class UserAction extends ActionSupport /*implements ModelDriven, ServletRequestAware*/{
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	Customer custObj = new Customer();
	Network nd = new Network();
	NetworkJoin nj = new NetworkJoin();
	LoginDao logindao = new LoginDao();
	CustomerDao custdao = new CustomerDao();
	public String execute(){
		try{
			String uname=request.getParameter("username");
			String password=request.getParameter("password");
			String role = "user";
			custObj.setEmail(uname);
			custObj.setPassword(password);
			custObj.setRole("user");
			session.setAttribute("username",uname);
			session.setAttribute("password",password);
			session.setAttribute("role","user");
			session.setAttribute("loggedin", false);
			System.out.println("uname "+uname+" password "+password+"role "+role);
			if(logindao.validateUser(custObj)){
				if(logindao.CheckFirstLogin(custObj).equalsIgnoreCase("Y"))
				{
					session.setAttribute("loggedin", true);
					return "firsttime";
				}else{
					session.setAttribute("loggedin", true);
					System.out.println("HERE");
					return "success";
				}
			}
			else{
				addActionError("Invalid Credentials");
				session.setAttribute("loggedin", false);
				return ERROR;
			}
		}
		catch(NullPointerException e){
			e.printStackTrace();
			return "exec";
		}
		catch(Exception e){
			return "fatal";
		}
	}
	public String helps(){
		try{
			System.out.println(session.getAttribute("loggedin"));
			if((Boolean)session.getAttribute("loggedin") == true)
				return SUCCESS;
			else
				return "klogin";
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String userData(){
		try{
			System.out.println(session.getAttribute("loggedin"));
			if((Boolean)session.getAttribute("loggedin") == true)
				return SUCCESS;
			else
				return "klogin";
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public void fetchmyproducts(){
		String uname = (String)session.getAttribute("username");
		System.out.println("inside fetch products");
		custObj.setEmail(uname);
		List<Product> prdlst = custdao.fetchmyproducts(custObj);
		try{
			JSONArray jsonArray = new JSONArray(prdlst);
			/*for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));*/
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}catch(Exception e){
			
		}
	}
	
	public void checknetworknames(){
		String uname = (String)session.getAttribute("username");
		List<Network> lst=custdao.checknetworknames();
		try{
			JSONArray jsonArray = new JSONArray(lst);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){
			
		}
	}
	public void checknetworkid(){
		String uname = (String)session.getAttribute("username");
		custObj.setEmail(uname);
		List<Network> lst=custdao.checknetworkid(custObj);
		try {
			JSONArray jsonArray = new JSONArray(lst);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void networkcreate(){
		try{
			String uname = (String)session.getAttribute("username");
			String networkname=request.getParameter("nname");
			System.out.println(networkname);
			String networkid = request.getParameter("networkid");
			nd.setAdmin(uname);
			nd.setNetworkID(networkid);
			nd.setNetworkName(networkname);
			nd.setTimer("60");
			if(custdao.networkcreate(nd)){
				response.getWriter().print("success");
			}
			else{
				response.getWriter().print("error");
			}
		}catch(Exception r){
			r.printStackTrace();
		}
	}
	public void checknetworknumber(){
		String uname = (String)session.getAttribute("username");
		custObj.setEmail(uname);
		List<Network> lst=custdao.checknetworknumber(custObj);
		try{
			JSONArray jsonArray = new JSONArray(lst);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){
			
		}
	}
	public String networkDetails(){
		try{
			System.out.println(session.getAttribute("loggedin"));
			if((Boolean)session.getAttribute("loggedin") == true)
				return SUCCESS;
			else
				return "klogin";
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String showProducts(){
		String uname=(String)session.getAttribute("username");
		session.setAttribute("username", uname);
		request.setAttribute("uname", uname);
		try{
			System.out.println(session.getAttribute("loggedin"));
			if((Boolean)session.getAttribute("loggedin") == true)
				return SUCCESS;
			else
				return "klogin";
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public void extractuser(){
		String uname = (String)session.getAttribute("username");
		custObj.setEmail(uname);
		System.out.println(uname);
		List<Customer> lst=custdao.fetchData(custObj);
		Customer cst=lst.get(0);
		try {
			JSONArray jsonArray = new JSONArray(lst);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String changepassword(){
		String uname = (String)session.getAttribute("username");
		String pwd=(String)request.getParameter("newpwd");
		custObj.setEmail(uname);
		custObj.setPassword(pwd);
		if((Boolean)session.getAttribute("loggedin") == true)
		{			if(custdao.changepassword(custObj))
						return SUCCESS;
					else
						return ERROR;
			}else{
				return "klogin";
			}
}
}

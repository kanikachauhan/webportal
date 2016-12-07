package Action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import Dao.CustomerDao;
import Dao.LoginDao;
import Dao.ProductDao;
import Model.Customer;
import Model.Login;
import Model.Network;
import Model.Product;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven, ServletRequestAware{
	private Login login=new Login();
	static private LoginDao ado=new LoginDao();
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	String password,networkname;
	static String uname;
	CustomerDao cdo=new CustomerDao();
	ProductDao pdo=new ProductDao();
	public String execute(){
		try{
		uname=request.getParameter("username");
		password=request.getParameter("password");
		login.setPassword(password);
		login.setRole("user");
		login.setUsername(uname);
		System.out.println(ado);
		session.setAttribute("username",uname);
		session.setAttribute("password",password);
		session.setAttribute("role","user");
		session.setAttribute("loggedin", false);
		if(ado.checkpassword(login) && ado.validateAdmin(login)){
			session.setAttribute("loggedin", true);
				return "firsttime";
		}
		else{
			if(ado.validateAdmin(login)){
				System.out.println(session.getAttribute("username"));
				session.setAttribute("loggedin", true);
				System.out.println(session.getAttribute("loggedin"));
				return SUCCESS;
			}
			else{
				addActionError("Invalid Credentials");
				session.setAttribute("loggedin", false);
				return ERROR;
			}
		}
	  }
		catch(org.springframework.dao.EmptyResultDataAccessException e){
			session.setAttribute("loggedin", false);
			return "exec";
		}
		catch(Exception e){
			e.printStackTrace();
			session.setAttribute("loggedin", false);
			return "fatal";
		}
	}
	public String showProducts(){
		session.setAttribute("username", uname);
		System.out.println(session.getAttribute("username")); 
		System.out.println(session.getAttribute("loggedin"));
		request.setAttribute("uname", uname);
		//return SUCCESS;
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
	
	public void extractproduct(){
		String uname = (String)session.getAttribute("username");
		List<Product> lst=pdo.getProducts(uname);
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

	public void extractuser(){
		String uname = (String)session.getAttribute("username");
		List<Customer> lst=cdo.fetchData(uname);
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
	public String networkcreate(){
		String uname = (String)session.getAttribute("username");
		networkname=request.getParameter("nname");
		String networkid = request.getParameter("networkid");
		System.out.println(networkname);
		if(cdo.networkcreate(uname, networkname, networkid)==2){
			addActionMessage("Details Saved");
			return "enter";
		}
		else{
			addActionError("Invalid Credentials");
			return "error";
		}
	}
	public void checknetworknames(){
		String uname = (String)session.getAttribute("username");
		List<Network> lst=cdo.checknetworknames(uname);
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
	public void checknetworknumber(){
		String uname = (String)session.getAttribute("username");
		List<Network> lst=cdo.checknetworknumber(uname);
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
	public void fetchmyproducts(){
		String uname = (String)session.getAttribute("username");
		List<Product> prdlst = cdo.fetchmyproducts(uname);
		try{
			JSONArray jsonArray = new JSONArray(prdlst);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}catch(Exception e){
			
		}
	}
	public void checknetworkid(){
		String uname = (String)session.getAttribute("username");
		List<Network> lst=cdo.checknetworkid(uname);
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
			if((Boolean)session.getAttribute("loggedin") == true)
			{			if(cdo.changepassword(uname,pwd)==2)
							return SUCCESS;
						else
							return ERROR;
			}else{
				return "klogin";
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
	public String productDetails(){
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
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}
}

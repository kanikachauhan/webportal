
package Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.springframework.data.mongodb.core.MongoAdminOperations;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Dao.CustomerDao;
import Dao.LoginDao;
import Dao.ProductDao;
import Model.Customer;
import Model.Product;

public class AdminAction  extends ActionSupport{
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	Customer custObj = new Customer();
	LoginDao logindao = new LoginDao();
	ProductDao prodDao = new ProductDao();
	CustomerDao cd = new CustomerDao();
	Product prd = new Product();
	//first
	public String execute(){
		try{
			String uname=request.getParameter("uname");
			String password=request.getParameter("password");
			String role = "admin";
			custObj.setEmail(uname);
			custObj.setPassword(password);
			custObj.setRole("admin");
			session.setAttribute("username",uname);
			session.setAttribute("password",password);
			session.setAttribute("role","admin");
			session.setAttribute("loggedin", false);
			System.out.println("uname "+uname+" password "+password);
			if(logindao.validateUser(custObj)){
				session.setAttribute("loggedin", true);
				return LOGIN;
			}
			else{
				return ERROR;
			}
		}
		catch(NullPointerException e){
			return "exec";
		}
		catch(Exception e){
			return ERROR;
		}
	}
	//second
	public void getallproduct(){
		try{
			Gson gson = new Gson(); 
			List<Product> cst=cd.getallproduct();
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("Pget all products");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}catch(Exception  e){
			e.printStackTrace();
		}
	}
	public String addAdminProduct(){
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
	public void productid(){
		manageproducts();
	}
	public void manageproducts(){
		try{
			Gson gson = new Gson(); String custid = request.getParameter("customerid");
			custObj.setCustomerID(custid);
			List<Product> cst=cd.manageproducts(custObj);
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("PRODUCTS ARRAY");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
	
	//second
	public void getalldata(){
		try{
			Gson gson = new Gson(); 
			List<Customer> cst=cd.getalldata();
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("get all data");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public String useraddproduct(){
		String uname=(String)request.getParameter("uname");
		String pid = (String)request.getParameter("productid");
		String[] sre = pid.split(",");
		ArrayList<String> aslt = new ArrayList<String>();
		for(int i=0;i<sre.length;i++)
			aslt.add(sre[i]);
		custObj.setEmail(uname);
		custObj.setProducts(aslt);
		if(cd.useraddproduct(custObj))
			return SUCCESS;
		else
			return ERROR;
	}
	public void savedata() throws IllegalStateException, IOException, ServletException{
		String cid="",fname="",mname="",lname="",emailid="",password="",contactno="",address="",macaddress="",productid ="",role="",spwd="";
		String noarr="",prarr="";
		try{
			cid=request.getParameter("cid");
    		fname=request.getParameter("fname");
    		mname=request.getParameter("mname");
    		lname=request.getParameter("lname");
    		emailid=request.getParameter("emailid");
    		password=request.getParameter("password");
    		contactno=request.getParameter("contactno");
    		address=request.getParameter("address");
    		macaddress=request.getParameter("macaddress");
    		productid = request.getParameter("prodid");
    		role = request.getParameter("role");
    		spwd = request.getParameter("spwd");
    		prarr = request.getParameter("arr");
    		noarr = request.getParameter("noarr");
    		custObj.setCustomerID(cid);
    		custObj.setEmail(emailid);
    		custObj.setName(fname+" "+mname+" "+lname);
    		custObj.setAddress(address);
    		custObj.setClientPassword(spwd);
    		custObj.setFirstLoginFlag("Y");
    		custObj.setPassword(password);
    		custObj.setRole(role);
    		custObj.setPhoneNumber(contactno);
    		custObj.setMacAddress(macaddress);
    		String[] sre = prarr.split(",");
    		ArrayList<String> aslt = new ArrayList<String>();
    		for(int i=0;i<sre.length;i++)
    			aslt.add(sre[i]);
    		custObj.setProducts(aslt);
    		cd.insertCustomer(custObj);
    		System.out.println(cid+" "+fname+" "+lname+" "+emailid+" "+password+" "+contactno+" "+address+" "+role+" "+spwd);            		           
    		System.out.println(prarr);
		}catch(Exception e){
			
		}
	}
	public void updatedata(){
		try{
		String cid=request.getParameter("customerid");
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String emailid=request.getParameter("emailid");
		String contactno=request.getParameter("contactno");
		String address=request.getParameter("address");
		//String macaddress=request.getParameter("macaddress");
		custObj.setEmail(emailid);
		custObj.setAddress(address);
		custObj.setName(fname+" "+mname+" "+lname);
		custObj.setPhoneNumber(contactno);
		custObj.setCustomerID(cid);
		System.out.println("inside "+cid+" "+fname+" "+lname+" "+emailid+" "+contactno+" "+address);
		if(cd.updaterecords(custObj)){
			addActionMessage("Details updated");
			}
		else{
			addActionError("Some Error while saving");
		}
		}catch(Exception e){
			
		}
	}
	public void deletedata(){
		try{
			String custid=request.getParameter("customerid");
			if(custid!=null){
				String val[] = custid.split(",");
				if(val.length>0){
					cd.deleteData(val);
				}
			}
		}
		catch(Exception e){
		}
	}
	//third
	public void addaddAdminProduct(){
		String pid = request.getParameter("pid");
		String pname = request.getParameter("name");
		String desc = request.getParameter("description");
		System.out.println(pid+" "+pname+" "+desc);
		prd.setProductID(pid);
		prd.setName(pname);
		prd.setDescription(desc);
		prodDao.insertProduct(prd);
	}
	public void deleteAdminProduct(){
		try{
			String val = request.getParameter("deletearr");
			System.out.println(val);
			if(val!=null ||val.equals("") || !val.isEmpty()){
				String[] getprds = val.split(",");
				System.out.println(getprds.length);
				if(cd.deleteValues(getprds))
					response.getWriter().println("success");
//				/response.getWriter().println("error");	
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void deleteproduct(){
		String pid = request.getParameter("pid");
		prd.setProductID(pid);
		prodDao.productdelete(prd);
	}
	public String help(){
		try{
			if((Boolean)session.getAttribute("loggedin") == true)
				return SUCCESS;
			else
				return "klogin";
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String logout(){
    	session.removeAttribute("loggedin");
    	session.invalidate();
    	return SUCCESS;
    }
	public String manageUser(){
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
	public void tabledata(){
		try{
			Gson gson = new Gson(); 
			List<Customer> cst=cd.fetchdata();
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){}
		//return SUCCESS;
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
	public void fetchProducts(){
		try{
			Gson gson = new Gson(); 
			List<Product> cst=prodDao.fetchAllproducts();
			System.out.println(cst.size());
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("PRODUCTS ARRAY");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
}

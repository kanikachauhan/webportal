
package Action;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.web.multipart.MultipartRequest;

import Dao.CustomerDao;
import Dao.DatabaseDao;
import Dao.LoginDao;
import Dao.ProductDao;
import Dao.ServerDao;
import Model.Customer;
import Model.Login;
import Model.Product;
import Model.Server;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.google.gson.Gson;
import com.mysql.jdbc.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.MultipartStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
@MultipartConfig(maxFileSize = 16177215)
public class AdminAction  extends ActionSupport implements ModelDriven,RequestAware{
//	private Map<String,Object> request;
	private Login login=new Login();
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	
	static private String imgmacaddress="";
	static private LoginDao ado=new LoginDao();
	static private CustomerDao cdo=new CustomerDao();
	static private ProductDao pro=new ProductDao();
	static private ServerDao sdo = new ServerDao();
	static private String custtid;
	 private Map<String, Object> sessions;
	static String fname="",mname="",lname="",emailid="",pwd="",cno="",add="";
	  private File userImage;
	  byte b[]=null;
	  int f=0;
	    File img;
	    String imgFileName,imgContentType;
	    String mail,msg;
	    FileOutputStream fos;
	    private String userImageContentType;
	    private String userImageFileName;
	    public File getImg() {
	        return img;
	    }

	    public FileOutputStream getFos() {
	        return fos;
	    }

	    public void setFos(FileOutputStream fos) {
	        this.fos = fos;
	    }

	    
	    public void setImg(File img) {
	        this.img = img;
	    }

	    public String getImgFileName() {
	        return imgFileName;
	    }

	    public void setImgFileName(String imgFileName) {
	        this.imgFileName = imgFileName;
	    }

	    public String getImgContentType() {
	        return imgContentType;
	    }
	    public void setImgContentType(String imgContentType) {
	        this.imgContentType = imgContentType;
	    }
	    public String getMsg() {
	        return msg;
	    }

	    public void setMsg(String msg) {
	        this.msg = msg;
	    }

	    public String getMail() {
	        return mail;
	    }

	    public void setMail(String mail) {
	        this.mail = mail;
	    }
	    
	
	    public byte[] getB() {
	        return b;
	    }

	    public void setB(byte[] b) {
	        this.b = b;
	    }
	    public String logout(){
	    	//session.invalidate();
	    	session.removeAttribute("loggedin");
	    	session.invalidate();
	    	return SUCCESS;
	    }
	public String execute(){
		try{
		String uname=request.getParameter("username");
		String password=request.getParameter("password");
		login.setPassword(password);
		login.setRole("admin");
		login.setUsername(uname);
		System.out.println(ado);
		session.setAttribute("username",uname);
		session.setAttribute("password",password);
		session.setAttribute("role","admin");
		session.setAttribute("loggedin", false);
		if(ado.validateAdmin(login)){
			System.out.println("inside admin login");
			session.setAttribute("loggedin", true);
			System.out.println(session.getAttribute("loggedin"));
			return LOGIN;
		}
		else{
			addActionError("Invalid Credentials");
			session.setAttribute("loggedin", false);
			return ERROR;
		}
		}
		catch(org.springframework.dao.EmptyResultDataAccessException e){
			System.out.println(e);
			session.setAttribute("loggedin",false);
			return "exec";
		}
	}
	public String help(){
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
	public void deleteproduct(){
		String pid = request.getParameter("pid");
		Product pd = new Product();
		pd.setPid(pid);
		pro.productdelete(pd);
	}
	public void addaddAdminProduct(){
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String desc = request.getParameter("pdesc");
		Product pd = new Product();
		pd.setPid(pid);
		pd.setName(pname);
		pd.setDescription(desc);
		pro.insertProduct(pd);
	}
	public String productDetails(){
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
	public void productid(){
		custtid=request.getParameter("customerid");
		System.out.println(custtid);
		manageproducts();
	}
	public void fetchProducts(){
	try{
		Gson gson = new Gson(); 
		List<Product> cst=pro.fetchAllproducts();
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
	public void manageproducts(){
		try{
			Gson gson = new Gson(); 
			List<Product> cst=cdo.manageproducts(custtid);
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
	public void sensortb(){
		try{
			Gson gson = new Gson(); 
			List<Product> cst=cdo.managesensortb(custtid);
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("Sensors ARRAY");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
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
	            		imgmacaddress = macaddress;
	            		spwd = request.getParameter("spwd");
	            		prarr = request.getParameter("arr");
	            		noarr = request.getParameter("noarr");
	            	System.out.println(cid+" "+fname+" "+lname+" "+emailid+" "+password+" "+contactno+" "+address+" "+macaddress+" "+productid+" "+role+" "+spwd);            		           
	            	System.out.println(prarr+" "+noarr);
//	            	Product prd=new Product();
//	            	prd.setMacaddress(macaddress);
//	            	prd.setPid(productid);
//	            	prd.setUname(emailid);
//		
		Customer cust=new Customer(cid,fname,mname,lname,emailid,password,contactno,address,role);
		System.out.println(cdo);
		Server s = new Server();
		s.setServerPassword(spwd);
		s.setUserId(cid);
		if(cid!=null && fname!=null && lname!=null && emailid!=null && password!=null && contactno!=null && address!=null && role!=null && spwd!=null)
		{
			String pparr[] = prarr.split(",");
			int count = 0,icount1=0,icount2=0;
			count = cdo.insertrecords(cust);
			boolean flag = true;
			for(int j=0;j<pparr.length;j++){
					String valarr[] = pparr[j].split("=");
					String pval = valarr[0].substring(6,valarr[0].length());
					String mval = valarr[1].substring(5,valarr[1].length()-1);
					System.out.println("product with macaddr" + pval+"  "+mval);
					Product prd=new Product();
	            	prd.setMacaddress(mval);
	            	prd.setPid(pval);
	            	prd.setUname(emailid);
	            	icount1=pro.insertClientMacDetails(prd,cust,spwd);
	            	if(mval.isEmpty()||mval.equals("")||mval==null)
	            	{}else
	            	{
	            		icount2=pro.insertUserProduct(prd);
	            	}
	            	if(icount1==0)
	            	{	
	            		flag= false;
	            		break;
	            	}
				}
			if(count==0||flag==false){
				addActionMessage("Error While Saving");
			}else{
				addActionMessage("Details saved");
			}
		}
			else{
				addActionError("Fields Null");
				//return "null";
			}
		}
		catch(Exception e){
				System.out.println(e);
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
		System.out.println("inside "+cid+" "+fname+" "+lname+" "+emailid+" "+contactno+" "+address);
		if(cdo.updaterecords(cid,fname,mname,lname,emailid,contactno,address)>0){
			addActionMessage("Details updated");
			}
		else{
			addActionError("Some Error while saving");
		}
		}catch(Exception e){
			
		}
	}
	public String addproduct(){
		System.out.println("inside add product"+custtid);
		String macaddress=(String)request.getParameter("modalmacaddress");
		String pname=(String)request.getParameter("modalpname");
		String pdesc=(String)request.getParameter("modaldesc");
		String uname=(String)request.getParameter("uname");
		//Customer c=new Customer();
		Product p=new Product();
		p.setMacaddress(macaddress);
		p.setDescription(pdesc);
		p.setName(pname);
		p.setUname(uname);
		Map<String,Object> vals=cdo.addCustomer(custtid);
		fname=(String)vals.get("fname");
		mname=(String)vals.get("mname");
		lname=(String)vals.get("lname");
		emailid=(String)vals.get("emailid");
		pwd=(String)vals.get("passwrd");
		cno=(String)vals.get("contactno");
		add=(String)vals.get("address");
		imgmacaddress = macaddress;
		System.out.println(fname+" "+mname+" "+lname+" "+emailid+" "+pwd+" "+cno+" "+add);
		if(pro.insertProduct(p)>0)
			return SUCCESS;
		else 
			return ERROR;
		
	} 
	public String useraddproduct(){
		String macaddress=(String)request.getParameter("modalmacaddress");
		String uname=(String)request.getParameter("uname");
		String pid = (String)request.getParameter("productid");
		Product prd = new Product();
		prd.setPid(pid);
		prd.setUname(uname);
		prd.setMacaddress(macaddress);
		Customer cst = new Customer("","","","",uname,"","","","");
		if(pro.insertUserSensor(prd,cst)>0 /*&& pro.insertClientMacDetails(prd, cst,)>0*/)
			return SUCCESS;
		else
			return ERROR;
	}
	public String userproductdelete(){
		System.out.println("here for delete");
		String macaddress=(String)request.getParameter("macaddress");
		String uname=(String)request.getParameter("uname");
		Product prd=new Product();
		prd.setDescription("");
		prd.setMacaddress(macaddress);
		prd.setUname(uname);
		prd.setName("");
		System.out.println(macaddress+" "+uname);
		if(pro.userproductdelete(prd)>1)
			return SUCCESS;
		else
			return ERROR;
	}
	public void deletedata(){
		try{
			String custid=request.getParameter("customerid");
			System.out.println(custid);
			if(custid!=null){
				System.out.println("here ");
				if(cdo.deleteData(custid)>=4)
					addActionMessage("Account deleted");
//				if(cdo.checkaccountdeletion(custid)>=3)
					
			}
		}
		catch(Exception e){
		}
	}
	public void getmacaddress(){
		try{
			Gson gson = new Gson(); 
			List<Customer> cst=cdo.fetchmacaddress();
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){
			
		}
	}
	public void tabledata(){
		try{
			Gson gson = new Gson(); 
			List<Customer> cst=cdo.fetchdata();
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
		//return SUCCESS;
	}

	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
}

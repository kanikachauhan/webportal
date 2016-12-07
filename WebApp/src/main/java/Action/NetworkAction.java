package Action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import Dao.CustomerDao;
import Model.Customer;
import Model.Network;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class NetworkAction extends ActionSupport implements ModelDriven{
	static private CustomerDao cdo=new CustomerDao();
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	static String uname;
	static String removenetwork;
	public String mynetwork(){
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
	public void timer(){
		String nname=(String)request.getParameter("nname");
		Integer timer=Integer.parseInt((String)request.getParameter("timer"));
		cdo.savetimer(nname,timer);
		
	}
	public String deletenetwork(){
		String nname=(String)request.getParameter("nname");
		System.out.println("inside delete network");
		if(cdo.deletenetwork(nname)>0)
			return SUCCESS;
		else
			return ERROR;
	}
	public String createnetwork(){
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
	public String joinnetwork(){
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
	public void allnetworkdata(){
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.allnetworkdata();
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
	
	public void allnetworks(){
		System.out.println("all networks");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.allnetworks();
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
//		/return SUCCESS;
	}
	/*public void allnetworknames(){
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.allnetworknames();
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}*/
	public void networknames(){
		uname = (String)session.getAttribute("username");
		System.out.println("inside join network");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.fetchNetworks(uname);
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
//		/return SUCCESS;
	}
	public void myjoinednetwork(){
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<String> nname=cdo.myjoinednetwork(uname,"joinee");
			JSONArray jsonArray = new JSONArray(nname);

			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
	public void ownnetwork(){
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<String> cst=cdo.fetchMyNetworks(uname);
			JSONArray jsonArray = new JSONArray(cst);
			
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
	public void getuser(){
		try{
			System.out.println("user logged in");
			Gson gson=new Gson();
			//String uname=cdo.returnuser();
			uname = (String)session.getAttribute("username");
			System.out.println(uname);
			System.out.println("before user logged in");
			List<String> unamelist=new ArrayList<String>();
			unamelist.add(uname);
			JSONArray jsonArray = new JSONArray(unamelist);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			System.out.println("after user logged in");
			
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){
			
		}
	}
	public String request(){
		String oflag=(String)request.getParameter("oflag");
		String jflag= (String)request.getParameter("jflag");
		String nname=(String)request.getParameter("nname");
		String uname = (String)session.getAttribute("username");
		List lst=cdo.checkpresent(nname, uname,oflag,jflag);
		System.out.println("list size"+lst.size());
		
		if(lst.size()==0){
			System.out.println("not present");
			if(cdo.request(nname, uname, oflag, jflag)>0)
				return SUCCESS;
			return ERROR;
		}else{	
			System.out.println("already present");
			//if(cdo.updaterequest(nname, uname, oflag, jflag)>0)
				return SUCCESS;
				//	return ERROR;
		}
	}
	public String changestatus(){
	//	System.out.println("CHANGE STATUS");
		String status=(String)request.getParameter("status");
		String requestee=(String)request.getParameter("requestee");
		String nname=(String)request.getParameter("nname");
		System.out.println("  "+requestee+" "+nname);
		if(status.equals("Joined")){
			if((cdo.joinnetwork(nname,requestee,status))>1)
				return SUCCESS;
			else
				return ERROR;
		}
			else{
				//System.out.println(status+"  "+requestee+" "+nname);
				if(cdo.cancelledrequest(nname,requestee,status)>1)
					return SUCCESS;
				else 
					return ERROR;
			}
	}
	public void networktb(){
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.fetchNetworktb(uname);
			JSONArray jsonArray = new JSONArray(cst);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){}
	}
	public void reqstatus(){
		System.out.println("inside req status");
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.reqstatus(uname);
			System.out.println(uname);
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("inside network join");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){
			
		}
	}
	public void joinednetworkss(){
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.joinednetworkss(uname,"joinee");
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("inside network join");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}			
	}
	public void networkjoin(){
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.fetchNetworkjoin(uname);
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("inside network join");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
	public void mymembers(){
		removenetwork = (String)request.getParameter("nname");
	}
	public void removeuser(){
		String joinee=(String)request.getParameter("joinee");
		String nname=(String)request.getParameter("nname");
		String status=(String)request.getParameter("ustatus");
		cdo.removeuser(nname,joinee,status);
	}
	public void leavenetwork(){
		uname = (String)session.getAttribute("username");
		String nname = (String)request.getParameter("nname");
		cdo.removefromnetworkjoin(nname,uname);
		
	}
	public void members(){
		System.out.println("inside members");
		try{
			Gson gson = new Gson();
			List<Network> cst=cdo.getMembers();
			JSONArray jsonArray=new JSONArray(cst);
			System.out.println(uname);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		
		}
		catch(Exception e){
			
		}
	}
	public void networkdata(){
		uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.fetchNetworkdata(uname,"n","y");
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println(uname);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){}
	}
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}

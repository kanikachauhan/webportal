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
import Dao.ServerDao;
import Model.Customer;
import Model.Network;
import Model.NetworkJoin;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class NetworkAction extends ActionSupport {
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	ServerDao cdo = new ServerDao();
	CustomerDao cd = new CustomerDao();
	Network nw = new Network();
	Customer cst = new Customer();
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
		}
		catch(Exception e){}
	}
	//first
	public void getallnetworks(){
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.allnetworks();
			JSONArray jsonArray = new JSONArray(cst);

			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	// second
	public void getownednetworksforcurrentuser(){
		String uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			nw.setAdmin(uname);
			List<Network> cst=cdo.fetchNetworktb(nw);
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("owned networks");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//third
	public void getjoinednetworksforcurrentuser(){
		String uname = (String)session.getAttribute("username");
		System.out.println(uname);
		try{
			Gson gson = new Gson(); 
			cst.setEmail(uname);
			List<Network> cstt= cdo.getjoinednetworksforcurrentuser(cst);
			JSONArray jsonArray = new JSONArray(cstt);
			System.out.println("joined networks");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void networknames(){
		//uname = (String)session.getAttribute("username");
		//System.out.println("inside join network");
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
	public void allnetworkdata(){

		try{
			Gson gson = new Gson(); 
			List<Network> cst=cd.allnetworkdata();
			JSONArray jsonArray = new JSONArray(cst);
			System.out.println("herrrrrrrrrrrrrrrrrrrrrrrrrrrr");
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
			//request.setAttribute("data",jsonArray);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public void deletenetwork(){
		try{
			String val=(String)request.getParameter("deletearr");
			System.out.println(val);
			if(val!=null ||val.equals("") || !val.isEmpty()){
				String[] getprds = val.split(",");
				System.out.println(getprds.length);
				if(cdo.deletenetwork(getprds))
					response.getWriter().print("success");
//				/response.getWriter().println("error");	
				}
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	public void timer(){
		String nname=(String)request.getParameter("nname");
		String timer=(String)request.getParameter("timer");
		nw.setNetworkName(nname);
		nw.setTimer(timer);
		System.out.println(nname+" "+timer);
		cdo.savetimer(nw);

	}
//	public String changestatus(){
//		//	System.out.println("CHANGE STATUS");
//		String status=(String)request.getParameter("status");
//		String requestee=(String)request.getParameter("requestee");
//		String nname=(String)request.getParameter("nname");
//		System.out.println(status+"  "+requestee+" "+nname);
//		nj.setEmail(requestee);
//		//	nj.setName(nname);
//		nw.setNetworkName(nname);
//		if(status.equals("true")){
//			if((cdo.joinnetwork(nw,requestee))>1)
//				return SUCCESS;
//			else
//				return ERROR;
//		}
//		else{
//
//			if(cdo.cancelledrequest(nw,requestee)>1)
//				return SUCCESS;
//			else 
//				return ERROR;
//		}
//	}
	public void members(){
		System.out.println("inside members");
		try{
			Gson gson = new Gson();
			Network nj = new Network();
			String networkName= request.getParameter("networkName");
			//		nj.setNetworkName(networkName);
			//			System.out.println("****************************network name **********8"+networkName);
			List<Network> cst=cdo.getMembers(nj);
			JSONArray jsonArray=new JSONArray(cst);
			//System.out.println(uname);
			for(int i=0;i<jsonArray.length();i++)
				System.out.println(jsonArray.get(i));
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);

		}
		catch(Exception e){

		}
	}
//	public void networkjoin(){
//		String uname = (String)session.getAttribute("username");
//		try{
//			Gson gson = new Gson(); 
//			nj.setEmail(uname);
//			System.out.println(uname);
//			List<Network> cst=cdo.fetchNetworkjoin(nj);
//			JSONArray jsonArray = new JSONArray(cst);
//			System.out.println("inside network join");
//			for(int i=0;i<jsonArray.length();i++)
//				System.out.println(jsonArray.get(i));
//			response.setContentType("application/json");
//			response.getWriter().print(jsonArray);
//			//request.setAttribute("data",jsonArray);
//		}
//		catch(Exception e){}
//	}
	public void networkdata(){
		String uname = (String)session.getAttribute("username");
		try{
			Gson gson = new Gson(); 
			List<Network> cst=cdo.fetchNetworkdata(uname);
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
//	public void networktb(){
//		String uname = (String)session.getAttribute("username");
//		try{
//			Gson gson = new Gson(); 
//			nw.setAdmin(uname);
//			nj.setJoinflag("Y");
//			nj.setOwnflag("Y");
//
//			List<Network> cst=cdo.fetchNetworktb(nw);
//			JSONArray jsonArray = new JSONArray(cst);
//			for(int i=0;i<jsonArray.length();i++)
//				System.out.println(jsonArray.get(i));
//			response.setContentType("application/json");
//			response.getWriter().print(jsonArray);
//		}
//		catch(Exception e){}
//	}
	public void request(){
		try{
			String reqflag=(String)request.getParameter("reqflag");
			String nname=(String)request.getParameter("nname");
			String uname = (String)session.getAttribute("username");
			System.out.println(reqflag+"  "+nname+"   "+uname);
			nw.setNetworkName(nname);
				if(cdo.request(nw,uname)>0)
					response.getWriter().print("success");
				else
					response.getWriter().print("error");
		}catch(Exception e){
			e.printStackTrace();
		}
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


	public void removeuser(){
		String joinee=(String)request.getParameter("joinee");
		String nname=(String)request.getParameter("nname");
		String status=(String)request.getParameter("ustatus");
		nw.setNetworkName(nname);
//		cdo.leavenetwork(nw,joinee);
	}
	public void leavenetwork(){
		String uname = (String)session.getAttribute("username");
		try{
			String val=(String)request.getParameter("nname");
			System.out.println(val);
			if(val!=null ||val.equals("") || !val.isEmpty()){
				String[] getprds = val.split(",");
				System.out.println(getprds.length);
				cdo.leavenetwork(getprds,uname);
					response.getWriter().print("success");
				}
			}catch(Exception e){
				e.printStackTrace();
			}

	}
}

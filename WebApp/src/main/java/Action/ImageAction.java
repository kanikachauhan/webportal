package Action;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class ImageAction  extends ActionSupport implements ServletRequestAware {
	byte[] imageInByte = null;
	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	String uname;
	public void getImg(){
		 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("two");
	         Connection con = DriverManager.getConnection("jdbc:mysql://31.24.132.17/customer?autoReconnect=true","user","V2gJQVoxcDgC8sdn"); 
	         System.out.println("three");
	         Statement stmnt = con.createStatement();
	         System.out.println("four");
	         ResultSet rs = stmnt.executeQuery("select pimg from producttb where macaddress='101.101.101.120'");
	         if(rs.next())
	         	{
	            	 //out.println("inside query");
	            	 response.setContentType("image/jpg");
	            	 response.getOutputStream().write(rs.getBytes("pimg"));
	         		response.getOutputStream().close();
	            		            }
		 }catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

}

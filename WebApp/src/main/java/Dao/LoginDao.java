package Dao;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import Model.Login;
@Component
@Repository
public class LoginDao extends DatabaseDao{
	@Autowired
	private DatabaseDao ado;boolean valid=false;
	public boolean validateAdmin(Login login){
		try{
		String username=login.getUsername();
		String password=login.getPassword();
		String role=login.getRole();
		System.out.println(username+" "+password+" "+role);
		String query="select passwrd from customertable where emailid=? and role=?";
		System.out.println(ado.getJtemplate());
		System.out.println(username+" "+password+" "+role);
		String passw=ado.getJtemplate().queryForObject(query, new Object[]{username,role}, String.class);
		System.out.println("password  "+passw);
		if(passw.equals(password))
			valid=true;
		else 
			valid=false;
	
	}
		catch(Exception e){
			valid = false;
			System.out.println(e);
			
		}
		return valid;
	}
	public boolean checkpassword(Login login){
		String username=login.getUsername();
		boolean valid=false;
		System.out.println(ado.getJtemplate());
		System.out.println("fisrt time login");
		String lst=ado.getJtemplate().queryForObject("select newpassword from changepassword where emailid=?",new Object[]{username},String.class);
		System.out.println("abcd "+lst);
		if(lst.isEmpty()||lst==null)
			valid=true;
		else
			valid=false;
		return valid;
	}
}

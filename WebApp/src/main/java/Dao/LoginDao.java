package Dao;
import java.util.List;

import org.springframework.data.mongodb.core.MongoActionOperation;
import org.springframework.data.mongodb.core.MongoAdminOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.google.gson.Gson;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import Model.Customer;
import Model.Login;

public class LoginDao extends DatabaseDao{
	public boolean validateUser(Customer cst){
		boolean valid = true;
		try{
			String uname = cst.getEmail();
			String password  = cst.getPassword();
			String role = cst.getRole();
			System.out.println("uname "+uname+" password "+password);
//		//	MongoClient mongo = new MongoClient(
//					  new MongoClientURI( "mongodb://Shaktiman*gmail.com:pikkme*1234yehaipassword@35.167.134.166/arne_server1" )
//					);
//			//System.out.println(mongo.isLocked());
			Query searchUserQuery = new Query(Criteria.where("email").is(uname).and("password").is(password).and("role").is(role));
			//System.out.println(mongoOperation);
			System.out.println(mongoOperation.collectionExists("users"));
			Customer findcust =  mongoOperation.findOne(searchUserQuery, Customer.class,"users");
			System.out.println(findcust.getEmail());
			if(findcust!=null)
				valid= true;
			else
				valid = false;
		}
		catch(Exception e){
			valid = false;
			e.printStackTrace();
		}
		return valid;
	}
	public String CheckFirstLogin(Customer cst){
		String valid = "N";
		try{
			String uname = cst.getEmail();
			String password  = cst.getPassword();
			String role = cst.getRole();
			System.out.println("uname "+uname+" password "+password);
			Query searchUserQuery = new Query(Criteria.where("email").is(uname).and("password").is(password).and("role").is(role));
			Customer findcust =  mongoOperation.findOne(searchUserQuery, Customer.class,"users");
			System.out.println(findcust);
			Customer newobj = new Gson().fromJson(findcust.toString(), Customer.class);
			String flag = newobj.getFirstLoginFlag().toString();
			System.out.println(flag);
			if(findcust!=null){
				if(flag.equalsIgnoreCase("Y"))
					valid = "Y";
				else
					valid = "N";
			}	
			else
				valid = "N";
		}
		catch(Exception e){
			valid = "N";
			e.printStackTrace();
		}
		return valid;
	}
	
}

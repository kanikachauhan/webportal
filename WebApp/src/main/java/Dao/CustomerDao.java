package Dao;

import javax.sql.DataSource;

import java.io.File;
import java.io.FileInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.*;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;

import com.google.gson.Gson;
import com.mongodb.WriteResult;

import Model.Customer;
import Model.Network;
import Model.NetworkJoin;
import Model.Product;
import freemarker.core.CustomAttribute;

public class CustomerDao extends DatabaseDao{
	public boolean changepassword(Customer cust){
		boolean valid = false;
		try{
			String uname = cust.getEmail();
			String password  = cust.getPassword();
			Query searchUserQuery = new Query(Criteria.where("email").is(uname));
			Update update = new Update();
			update.set("password", password);
			update.set("firstLoginFlag", "N");
			WriteResult wr = mongoOperation.updateFirst(searchUserQuery, update, Customer.class);
			if(wr!=null)
				valid = true;
		}
		catch(Exception e){
			valid = false;
			e.printStackTrace();
		}
		return valid;
	}
	//fisrt
	public List<Customer> getalldata(){
		List<Customer> cst = new ArrayList<Customer>();
		try{
			List<Customer> getAll = mongoOperation.findAll(Customer.class);
			if(getAll!=null)
				cst = getAll;
		}catch(Exception e){
			e.printStackTrace();
		}
		return cst;
	}
	public List<Product> fetchmyproducts(Customer cst){
		List<Product> prd = new ArrayList<Product>();
		try{
			Query q = new Query(Criteria.where("email").is(cst.getEmail()));
			Customer ss = mongoOperation.findOne(q, Customer.class, "users");
			List<Product> st = ss.getProducts();
			System.out.println(st);
			
			if(st!=null)
			{
				Query q2 = new Query(Criteria.where("productID").in(st));
				List<Product> getall = mongoOperation.find(q2, Product.class, "products");
				System.out.println(getall);
				prd = getall;
			}
				
		}catch(Exception e){
			e.printStackTrace();
		}
		return prd;
	}
	//second
	public List<Product> getallproduct(){
		List<Product> cst = new ArrayList<Product>();
		try{
			List<Product> getAll = mongoOperation.findAll(Product.class);
			if(getAll!=null)
				cst = getAll;
		}catch(Exception e){
			e.printStackTrace();
		}
		return cst;
	}
	//thirds
	public boolean deleteValues(String[] ar){
		boolean valid = false;
//		List<Product> lst = null;
		try{
			Query q = new Query(Criteria.where("productID").in(ar));
//			System.out.println("1");
			mongoOperation.findAndRemove(q, Product.class);
//			System.out.println("2");
			valid = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return valid;
	}
	public boolean useraddproduct(Customer cst){
		boolean valid = false;
		try{
			
			System.out.println("add more products");
			Query searchUserQuery = new Query(Criteria.where("email").is(cst.getEmail()));
			Customer getCust = mongoOperation.findOne(searchUserQuery, Customer.class);
			ArrayList<String> aslt = getCust.getProducts();
			ArrayList<String> newaslt = cst.getProducts();
			System.out.println("before adding more products");
			if(aslt==null)
				aslt = new ArrayList();
		//	System.out.println(aslt);
			if(newaslt!=null){
				for(int i=0;i<newaslt.size();i++){
					aslt.add(newaslt.get(i));
				}
			}
			System.out.println("after adding more products");
			System.out.println(aslt);
			Update update = new Update();
			update.set("products", aslt);
			WriteResult wr = mongoOperation.updateFirst(searchUserQuery, update, Customer.class);
			if(wr!=null)
				valid = true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return valid;
	}
	public List<Product> manageproducts(Customer cst){
		List<Product> prd = new ArrayList<Product>();
		Query searchUserQuery = new Query(Criteria.where("customerID").is(cst.getCustomerID()));
		System.out.println(searchUserQuery.toString());
		Customer getCust = mongoOperation.findOne(searchUserQuery, Customer.class);
		System.out.println(getCust.getCustomerID());
		ArrayList<String> aslt = getCust.getProducts();
		System.out.println(aslt);
		System.out.println("here in array");
		for(int i=0;i<aslt.size();i++){
			Query searchProductQuery = new Query(Criteria.where("productID").is(aslt.get(i)));
			System.out.println("inside loop ");
			Product prds = mongoOperation.findOne(searchProductQuery, Product.class,"products");
			System.out.println(prds+"here");
			prd.add(prds);
		}
		return prd;
	}
	
	public List<Network> checknetworkid(Customer cst){
		List<Network> ss = new ArrayList<Network>();
		Query searchProductQuery = new Query(Criteria.where("admin").is(cst.getEmail()));
		List<Network> ssr=mongoOperation.find(searchProductQuery,Network.class,"networks");
		return ss;
	}
	public List<Network> checknetworknumber(Customer cst){
		List<Network> flist = new ArrayList<Network>();
		try{
			
	 		Query searchNetworkName = new Query(Criteria.where("email").is(cst.getEmail()));
			Customer ncst = mongoOperation.findOne(searchNetworkName, Customer.class);
			List<String> createdList = ncst.getCreatedNetwork();
			List<String> joinedList = ncst.getJoinedNetwork();
			List<Network> createdListNetwork = new ArrayList<Network>();
			List<Network> joinedListNetwork = new ArrayList<Network>();
			if(createdList!=null){
				for(int i = 0;i<createdList.size();i++){
					Query sname = new Query(Criteria.where("networkName").is(createdList.get(i)));
					Network nobj = mongoOperation.findOne(sname, Network.class);
					createdListNetwork.add(nobj);
				}
			}
			if(joinedList!=null){
					for(int i = 0;i<joinedList.size();i++){
						Query sname = new Query(Criteria.where("networkName").is(createdList.get(i)));
						Network nobj = mongoOperation.findOne(sname, Network.class);
						joinedListNetwork.add(nobj);
				}
			}
			flist.addAll(createdListNetwork);
			flist.addAll(joinedListNetwork);
			System.out.println("all list");
			for(int i=0;i<flist.size();i++)
				System.out.println(flist.get(i));
		}catch(Exception e){
			flist = null;
			e.printStackTrace();
		}
		return flist;
	}
	public List<Network> checknetworknames(){
		List<Network> ss =	mongoOperation.findAll(Network.class, "networks");
		return ss;
	}
	public List<Network> allnetworkdata(){
		List<Network> ss =	mongoOperation.findAll(Network.class, "networks");
		return ss;
	}
	//fourth
	public boolean networkcreate(Network nd){
		mongoOperation.insert(nd,"networks");
		boolean valid = false;
		Update update = new Update();
		Query q = new Query(Criteria.where("email").is(nd.getAdmin()));
		Customer getCust = mongoOperation.findOne(q, Customer.class);
		ArrayList<String> str = getCust.getCreatedNetwork();
		if(str==null)
			str = new ArrayList<String>();
		str.add(nd.getNetworkName());
		update.set("createdNetwork",str);
		WriteResult wr = mongoOperation.updateFirst(q, update, Customer.class);
		if(wr!=null)
			valid = true;//mongoOperation.insert(nj,"NetworkJoin");
		return valid;
	}
	public List<Customer> fetchData(Customer cust){
		try{
		List<Customer> ss=new ArrayList<Customer>();
		Query searchUserQuery = new Query(Criteria.where("email").is(cust.getEmail()));
		Customer getCust = mongoOperation.findOne(searchUserQuery, Customer.class);
		System.out.println(getCust.getCustomerID()+cust.getName());
		ss.add(getCust);
		return ss;
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public List<Customer> fetchdata(){
		List<Customer> prds= mongoOperation.findAll(Customer.class, "users");
		return prds;
	}
	public void insertCustomer(Customer cst){
		mongoOperation.insert(cst, "users");
	}
	public boolean updaterecords(Customer cst){
		boolean valid = false;
		String custId = cst.getCustomerID();
		Query searchUserQuery = new Query(Criteria.where("customerID").is(cst.getCustomerID()));
		Customer getObj = mongoOperation.findOne(searchUserQuery, Customer.class);
		Update update = new Update();
		update.set("address", cst.getAddress());
		update.set("phoneNumber", cst.getPhoneNumber());
		update.set("name", cst.getName());
		WriteResult wr = mongoOperation.updateFirst(searchUserQuery, update, Customer.class);
		if(wr!=null)
			valid = true;
		return valid;
	}
	public boolean deleteData(String[] custobj){
		try{
			Query q = new Query(Criteria.where("email").in(custobj));
			mongoOperation.findAllAndRemove(q, "users");
			Query q1 = new Query(Criteria.where("admin").in(custobj));
			List<Network> lst = mongoOperation.find(q1, Network.class);
			mongoOperation.findAllAndRemove(q1, "networks");
			for(int i=0;i<lst.size();i++){
				
			}
			
		}catch(Exception e){
			
		}
	}
}

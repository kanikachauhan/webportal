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
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;

import Model.Customer;
import Model.Network;
import Model.Product;

public class CustomerDao extends DatabaseDao{
	static String utt="",loggedinuser="";
	@Autowired
	private DatabaseDao ado;
	public int insertrecords(Customer cust){
		//System.out.println(ado.getJtemplate());i
		int t2=0,t3=0;
		int t1=ado.getJtemplate().update("insert into customertable values(?,?,?,?,?,?,?,?,?)", cust.getCustomerid(),cust.getFirstname(),cust.getMiddlename(),cust.getLastname(),cust.getEmailid(),cust.getPassword(),cust.getContactno(),cust.getAddress(),cust.getRole());
		if(cust.getRole().equals("user")){
			t2 = ado.getJtemplate().update("insert into changepassword values(?,?,?)",cust.getEmailid(),"",cust.getPassword());
		}
		return t1+t2; 
	}
	public List fetchmyproducts(String username){
		List<Product> jtn = ado.getJtemplate().query("select productid,productname from producttable where productid in(select productid from userproducttable where macaddr in (select macaddr from client_mac_details where emailid =?))", new Object[]{username},new RowMapper<Product>(){
				public Product mapRow(ResultSet rs,int rownum) throws SQLException{
					Product pd = new Product();
					pd.setPid((String)rs.getString("productid"));
					pd.setName((String)rs.getString("productname"));
					pd.setMacaddress("");
					return pd;
				}
		});
		return jtn;
	}
	public List allnetworks(){
		return ado.getJtemplate().queryForList("select nname from networkdetails");
	}
	public List fetchNetworktb(String uname){
		//System.out.println("fetch network tb");
		return ado.getJtemplate().queryForList("select nname from networkdetails where networkid in (select networkid from usernetworkdetails where emailid=? and joinflag=? and ownerflag=?)",new Object[]{uname,"y","y"});
	}
	public List fetchNetworkjoin(String uname){
		List<Network> jtn = ado.getJtemplate().query("select emailid,nname from usernetworkdetails join networkdetails on usernetworkdetails.networkid = networkdetails.networkid where usernetworkdetails.networkid in(select networkid from usernetworkdetails where emailid = ? and ownerflag =? and joinflag = ?) and ownerflag =? and joinflag= ?",new Object[]{uname,"y","y","n","n"},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
 			Network n = new Network();
			n.setNetworkname((String)rs.getString("nname"));
			n.setConnectorname((String)rs.getString("emailid"));
			return n;
			}
		}) ;
		return jtn;
	}
	public List fetchNetworkdata(String uname,String oflag,String jflag){
		return ado.getJtemplate().queryForList("select networkdetails.nname from networkdetails where networkid in (select networkid from usernetworkdetails where emailid=? and ownerflag=? and joinflag=?)",new Object[]{uname,oflag,jflag});
	}
	public List allfetchNetworkdata(){
		return ado.getJtemplate().queryForList("select * from networkdata");
	}
	public String getOwner(String nname){
		return ado.getJtemplate().queryForObject("select ownername from networktb where nname=?",new Object[]{nname},String.class);
	}
	public List joinednetworkss(String uname,String status){
		List<Network> jtn = ado.getJtemplate().query("select nname from networkdata where joinee=? and ustatus=?", new Object[]{uname,status},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
 			Network n = new Network();
			n.setNetworkname((String)rs.getString("nname"));
			return n;
			}
		}) ;
		return jtn;
	}
	public List reqstatus(String uname){
		System.out.println("get status");
		List<Network> jtn = ado.getJtemplate().query("select * from networkjoin where requestee=?",new Object[]{uname},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs, int rownum) throws SQLException{
				System.out.println("inside obj");
				Network nn=new Network();
				nn.setNetworkname((String)rs.getString("nname"));
				nn.setCreatername((String)rs.getString("ownername"));
				nn.setConnectorname((String)rs.getString("requestee"));
				nn.setUserstatus((String)rs.getString("nstatus"));
				return nn;
			}
		});
		return jtn;
	}
	public int request(String nname,String name,String oflag,String jflag){
		String str = ado.getJtemplate().queryForObject("select networkid from networkdetails where nname=?", new Object[]{nname},String.class);
		return ado.getJtemplate().update("insert into usernetworkdetails values (?,?,?,?)",name,str,oflag,jflag);	
	}
	public int updaterequest(String nname,String ownername,String oflag,String jflag){
		return ado.getJtemplate().update("delete from  usernetworkdetails where emailid = ?  and ownerflag = ? and joinflag =? and networkid in ( select networkid from networkdetails where nname =?)",new Object[]{ownername,oflag,jflag,nname});
	}
	public List checkpresent(String nname,String uname,String oflag,String jflag){
//		/ ado.getJtemplate().queryForList("select nstatus from networkjoin where ownername=? and nname=? and requestee=?",new Object[]{ownername,nname,uname});
		 List<Network> jtn = ado.getJtemplate().query("select joinFlag,ownerFlag from usernetworkdetails where emailid=? and networkid in(select networkid from networkdetails where nname =?)",new Object[]{uname,nname},new RowMapper<Network>(){
				public Network mapRow(ResultSet rs, int rownum) throws SQLException{
					System.out.println("inside obj");
					Network nn=new Network();
					nn.setOwnerFlag((String)rs.getString("ownerFlag"));
					nn.setJoinFlag((String)rs.getString("joinFlag"));
					return nn;
				}
			});
		 	return jtn;
	}
	public int deleteData(String customerid){
		int a=0,b=0,c=0,d=0,e=0,f=0;
		System.out.println("here 1");
		utt = ado.getJtemplate().queryForObject("select distinct emailid from customertable where customerid=?",new Object[]{customerid},String.class);
		System.out.println("here 2");
		System.out.println(utt);
		System.out.println("here 3");
		a = ado.getJtemplate().update("delete from userproducttable where macaddr in (select macaddr from client_mac_details where emailid =?)",new Object[]{utt});
		b = ado.getJtemplate().update("delete from changepassword where emailid=? ",new Object[]{utt});
		List<String> lst = ado.getJtemplate().queryForList("select distinct networkid from usernetworkdetails where emailid=? and ownerflag=? and joinflag=?",new Object[]{utt,"y","y"},String.class);
		System.out.println(lst);
		for(int i=0;i<lst.size();i++){
			int t = ado.getJtemplate().update("delete from networkdetails where networkid=?",new Object[]{lst.get(i)});
			System.out.println(t);
		}//List<String> t=null;
	//	List<String>
		for(int i=0;i<lst.size();i++){
			int t = ado.getJtemplate().update("delete from usernetworkdetails where networkid=?",new Object[]{lst.get(i)});
			System.out.println(t);
		}//System.out.println(t);
		//d = ado.getJtemplate().update("delete from usernetworkdetails where emailid=?",new Object[]{utt} );
	//	e = ado.getJtemplate().update("delete from servertable where userid=?",new Object[]{customerid});
		c = ado.getJtemplate().update("delete from customertable where customerid=?",new Object[]{customerid});
		f = ado.getJtemplate().update("delete from client_mac_details where emailid=?",new Object[]{utt});
		return a+b+c+d+e+f;
	}
	public int checkaccountdeletion(String customerid){
		int t1=0,t2=0,t3=0,t4=0,t5=0,t6=0;
		String username=utt;
		System.out.println(customerid+" inside delete account");
		String cid=ado.getJtemplate().queryForObject("select emailid from customertable where customerid=?",new Object[]{customerid},String.class);
		System.out.println(cid+"count");
		/*
			t1=ado.getJtemplate().update("delete from changepassword where username=?",new Object[]{customerid});
			t2=ado.getJtemplate().update("delete from customertable where emailid=?",new Object[]{username});
			//t4 = ado.getJtemplate().update
			t3 = ado.getJtemplate().update("delete from usernetworkdetails where emailid=?",new Object[]{customerid} );
			t4 = ado.getJtemplate().update("delete from userproducttable where emailid=?",new Object[]{customerid});
			t5 = ado.getJtemplate().update("delete from servertable where userid=?",new Object[]{cid});
	*/
		return t1+t2+t3+t4+t5;
	}
	public List myjoinednetwork(String uname,String status){
		return ado.getJtemplate().queryForList("select nname from networkdata where joinee=? and ustatus=?",uname,status);
	}
	public List fetchMyNetworks(String uname){
		return ado.getJtemplate().queryForList("select nname from networktb where ownername=?",uname);
	}
	public List allnetworkdata(){
		List<Network> nw= ado.getJtemplate().query("select * from networkdetails join usernetworkdetails on networkdetails.networkid = usernetworkdetails.networkid",new RowMapper<Network>(){
			public Network mapRow(ResultSet rs, int rownum) throws SQLException{
				Network nn=new Network();
				nn.setNetworkname((String)rs.getString("nname"));
				nn.setJoinFlag((String)rs.getString("joinflag"));
				nn.setOwnerFlag((String)rs.getString("ownerflag"));
				nn.setConnectorname((String)rs.getString("emailid"));
				return nn;
			}
		});
		return nw;
	}
	public List managesensortb(String customerid){
		System.out.println("inside sensors");
		List<Product> prod=ado.getJtemplate().query("select productid from sensortb where emailid in (select emailid from customertable where customerid=?)",new Object[]{customerid},new RowMapper<Product>(){
			public Product mapRow(ResultSet rs, int rownum) throws SQLException{
				System.out.println("abcdjnjdn");
				Product pd=new Product();
				pd.setMacaddress("");
				pd.setDescription("");
				pd.setName("");
				pd.setPid((String)rs.getString("productid"));
				//pd.setUname((String)rs.getString("uname"));
				//System.out.println((String)rs.getString("macaddr")+" "+(String)rs.getString("productdesc")+" "+(String)rs.getString("productname"));
				return pd;
			}
		});
		System.out.println("here "+prod.size());
		return prod;
	}
	
	public List manageproducts(String customerid){
		System.out.println("inside products");
		List<Product> prod=ado.getJtemplate().query("select * from producttable where productid in(select productid from userproducttable where macaddr in(select macaddr from client_mac_details where emailid in (select emailid from customertable where customerid=?)))",new Object[]{customerid},new RowMapper<Product>(){
			public Product mapRow(ResultSet rs, int rownum) throws SQLException{
				System.out.println("abcdjnjdn");
				Product pd=new Product();
				//pd.setMacaddress((String)rs.getString("macaddr"));
				//pd.setDescription("");
				pd.setPid((String)rs.getString("productid"));
				pd.setName((String)rs.getString("productname"));
				//pd.setUname((String)rs.getString("uname"));
				//System.out.println((String)rs.getString("macaddr")+" "+(String)rs.getString("productdesc")+" "+(String)rs.getString("productname"));
				return pd;
			}
		});
		System.out.println("here "+prod.size());
		return prod;
	}
	public int removeuser(String nname,String joinee,String status){
		return ado.getJtemplate().update("delete from usernetworkdetails where emailid=? and ownerflag=? and joinflag=? and networkid in(select networkid from networkdetails where nname=?)",new Object[]{joinee,"n","y",nname});
	}
	public int removenetworkjoin(String nname,String nstatus,String requestee){
		return ado.getJtemplate().update("delete from networkjoin where nname=? and nstatus=? and requestee=?",new Object[]{nname,nstatus,requestee});
	}
	public int removefromnetworkjoin(String nname,String uname){
		return ado.getJtemplate().update("delete from usernetworkdetails where emailid = ? and ownerflag=? and joinflag=? and networkid in(select networkid from networkdetails where nname =?)",new Object[]{uname,"n","y",nname});
	}
	public int removefromnetworkdata(String nname,String uname,String status){
		return ado.getJtemplate().update("delete from networkdata where nname=? and joinee=? and ustatus=?",new Object[]{nname,uname,status});
	}
	public List getMembers(){
		List<Network> nw=ado.getJtemplate().query("select nname,emailid from networkdetails join usernetworkdetails on networkdetails.networkid = usernetworkdetails.networkid where ownerflag=? and joinflag=?",new Object[]{"n","y"},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
				Network n=new Network();
				//System.out.println((String)rs.getString("joinee")+"                 "+(String)rs.getString("nname"));
				n.setConnectorname((String)rs.getString("emailid"));
				n.setNetworkname((String)rs.getString("nname"));
				//System.out.println("inside array");
				return n;
			}
		});
		return nw;
	}
	public int changepassword(String username,String pwd){
		loggedinuser = username;
		int t1=ado.getJtemplate().update("update changepassword set newpassword=? where emailid=?",new Object[]{pwd,username});
		int t2=ado.getJtemplate().update("update customertable set passwrd=? where emailid=?",new Object[]{pwd,username});
		System.out.println(t1+t2);
		return t1+t2;
	}
	public String returnuser(){
		return loggedinuser;
	}
	public int updaterecords(String cid,String fname,String mname,String lname,String emailid,String contactno,String address){
		return ado.getJtemplate().update("update customertable set fname=?,mname=?,lname=?,emailid=?,contactno=?,address=? where customerid=?",fname,mname,lname,emailid,contactno,address,cid);
	}
	public List fetchdata(){
		System.out.println("inside fetch data");
		List<Customer> customers=ado.getJtemplate().query("select distinct customerid,fname,mname,lname,customertable.emailid,contactno,address,role,client_password from customertable join client_mac_details on client_mac_details.emailid = customertable.emailid where role=?",new Object[]{"user"},new RowMapper<Customer>(){
			public Customer mapRow(ResultSet rs,int rownum) throws SQLException{
				Customer cs=new Customer((String)rs.getString("customerid"),(String)rs.getString("fname"),(String)rs.getString("mname"),(String)rs.getString("lname"),(String)rs.getString("emailid"),(String)rs.getString("client_password"),(String)rs.getString("contactno"),(String)rs.getString("address"),(String)rs.getString("role"));
				//System.out.println("abc");
				return cs;
			}
		});
		return customers;
	}
	public List fetchmacaddress(){
		System.out.println("inside fetch data");
		List<Product> customers=ado.getJtemplate().query("select macaddr from userproducttable",new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int rownum) throws SQLException{
				Product cs=new Product();
				cs.setDescription("");
				cs.setMacaddress((String)rs.getString("macaddr"));
				cs.setName("");
				cs.setUname("");
				//System.out.println("abc");
				return cs;
			}
		});
		return customers;
	}
	public List fetchData(String uname){
		System.out.println("inside fetch data for username");
		//ado.getJtemplate().
		List<Customer> customers=ado.getJtemplate().query("select * from customertable where emailid='"+uname+"'",new RowMapper<Customer>(){
			public Customer mapRow(ResultSet rs,int rownum) throws SQLException{
				Customer cs=new Customer((String)rs.getString("customerid"),(String)rs.getString("fname"),(String)rs.getString("mname"),(String)rs.getString("lname"),(String)rs.getString("emailid"),(String)rs.getString("passwrd"),(String)rs.getString("contactno"),(String)rs.getString("address"),(String)rs.getString("role"));
				
				//System.out.println("abc");
				return cs;
			}
		});
		return customers;
	}
	public int joinnetwork(String nname,String requestee,String ustatus){
		String str = ado.getJtemplate().queryForObject("select networkid from networkdetails where nname =?",new Object[]{nname},String.class);
		return ado.getJtemplate().update("update usernetworkdetails set ownerflag=?,joinflag=? where networkid=? and emailid=?","n","y",str,requestee);
	}
	public int updatestatus(String status,String nname,String requestee){
		return ado.getJtemplate().update("update networkjoin set nstatus=? where nname=? and requestee=?",status,nname,requestee);
	}
	public int cancelledrequest(String nname,String requestee,String status){
		String str = ado.getJtemplate().queryForObject("select networkid from networkdetails where nname =?",new Object[]{nname},String.class);
		//System.out.println(ado.getJtemplate().update("update networkjoin set nstatus=? where nname=? and requestee=?",status,nname,requestee));
		return ado.getJtemplate().update("delete from usernetworkdetails where networkid =? and emailid =? and ownerflag=? and joinflag=?",new Object[]{str,requestee,"n","n"});
	}
	public int deleterequestee(String nname,String requestee,String status){
		return ado.getJtemplate().update("delete from networkdata where nname=? and joinee=? and ustatus=?",nname,requestee,status);
	}
	public int networkcreate(String uname,String networkname,String networkid){
		System.out.println(networkname);
		int insertNetwork = ado.getJtemplate().update("insert into networkdetails values (?,?,?)",new Object[]{null,networkname,0});
		int nid = ado.getJtemplate().queryForObject("select networkid from networkdetails where nname =?", new Object[]{networkname}, Integer.class);
		int insertUserNetwork = ado.getJtemplate().update("insert into usernetworkdetails values (?,?,?,?)",new Object[]{uname,nid,"y","y"});
		return insertNetwork+insertUserNetwork;
	}
	public List <Network> fetchNetworks(String uname){
		System.out.println("inside fetch data for username");
		List<Network> networks=ado.getJtemplate().query("select nname from networkdetails where networkid in(select networkid from usernetworkdetails where emailid = ? and ownerflag =? and joinflag=?)",new Object[]{uname,"y","y"},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
				Network ns=new Network();
				ns.setNetworkname((String)rs.getString("nname"));
				//ns.setCreatername((String)rs.getString("ownername"));
				return ns;
			}
		});
		return networks;
	}
	public List<Network> checknetworknames(String uname){
		List<Network> nws=ado.getJtemplate().query("select nname from networkdetails",new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
				Network ns=new Network();
				ns.setNetworkname((String)rs.getString("nname"));
				return ns;
			}	
		});
		return nws;
	}
	public List<Network> checknetworknumber(String uname){
		List<Network> nws=ado.getJtemplate().query("select networkid from usernetworkdetails where emailid=?",new Object[]{uname},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
				Network ns=new Network();
				ns.setNetworkname((String)rs.getString("networkid"));
				return ns;
			}	
		});
		return nws;
	}
	public List<Network> checknetworkid(String uname){
		List<Network> nws=ado.getJtemplate().query("select networkid from usernetworkdetails where emailid=? and ownerflag=? and joinflag=?",new Object[]{uname,"y","y"},new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
				Network ns=new Network();
				ns.setNetworkId((String)rs.getString("networkid"));
				return ns;
			}	
		});
		return nws;
	}
	/*public List <Network> fetchNetworks(){
		System.out.println("inside fetch data for username");
		List<Network> networks=ado.getJtemplate().query("select nname from networktb",new RowMapper<Network>(){
			public Network mapRow(ResultSet rs,int rownum) throws SQLException{
				Network ns=new Network();
				ns.setNetworkname((String)rs.getString("nname"));
				return ns;
			}
		});
		return networks;
	}*/
	public List getnetwork(String nname){
		return ado.getJtemplate().queryForList("select nname from timertable where nname=?",new Object[]{nname});
	}
	public int updatetimer(Integer timer,String nname){
		return ado.getJtemplate().update("update timertable set timer=? where nname=?",new Object[]{timer,nname});
	}
	public int savetimer(String nname,Integer timer){
			return ado.getJtemplate().update("update networkdetails set timer=? where nname=?",new Object[]{timer,nname});
	}
	public Map<String,Object> addCustomer(String id){
		System.out.println("inside add product"+id);
		//System.out.println(ado.getJtemplate().q("select distinct fname,mname,lname,emailid,passwrd,contactno,address from customertable where customerid=?",id));
		return ado.getJtemplate().queryForMap("select distinct fname,mname,lname,emailid,passwrd,contactno,address from customertable where customerid=?",id);
	}
	public int addProduct(String custtid,String fname,String mname,String lname,String emailid,String pwd,String cno,String add,String macaddress){
		return ado.getJtemplate().update("insert into customertable values(?,?,?,?,?,?,?,?,?)",custtid,fname,mname,lname,emailid,pwd,cno,add,macaddress);
	}
	public int deletenetwork(String nname){
		System.out.println(nname);
		String str = ado.getJtemplate().queryForObject("select networkid from networkdetails where nname =?", new Object[]{nname},String.class);
		System.out.println(str);
		return ado.getJtemplate().update("delete from usernetworkdetails where networkid =?",new Object[]{str})+ado.getJtemplate().update("delete from networkdetails where networkid=?",str);
	}
}

package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;

import Model.Customer;
import Model.Network;
import Model.Product;

public class ProductDao extends DatabaseDao {
	@Autowired
	private DatabaseDao ado;
	public int insertProduct(Product pd){
		System.out.println(pd.getDescription());
		return ado.getJtemplate().update("insert into producttable values(?,?,?)",pd.getPid(),pd.getName(),pd.getDescription());
	}
	public int productdelete(Product pd){
		return ado.getJtemplate().update("delete from producttable where productid=?",pd.getPid());
	}
	public int userproductdelete(Product pd){
		System.out.println(pd.getMacaddress()+" "+pd.getUname());
		return ado.getJtemplate().update("delete from userproducttable where macaddr=? and emailid=?",pd.getMacaddress(),pd.getUname());
	}
	public List<Product> fetchAllproducts(){
		List<Product> prds=ado.getJtemplate().query("select productid,productname,productdesc from producttable",new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int rownum) throws SQLException{
				Product ns=new Product();
				ns.setPid((String)rs.getString("productid"));
				ns.setName((String)rs.getString("productname"));
				ns.setDescription((String)rs.getString("productdesc"));
				return ns;
			}
		});return prds;
	}
	public int insertUserProduct(Product prd){
		return ado.getJtemplate().update("insert into userproducttable values(?,?)",prd.getPid(),prd.getMacaddress());
	}
	public int insertUserSensor(Product prd,Customer cst){
		String str = ado.getJtemplate().queryForObject("select macaddr from client_mac_details where emailid=?",new Object[]{cst.getEmailid()},String.class);
		return ado.getJtemplate().update("insert into userproducttable values(?,?)",prd.getPid(),str);
	}
	public int insertClientMacDetails(Product prd,Customer cst,String spwd){
		return ado.getJtemplate().update("insert into client_mac_details values(?,?,?)",cst.getEmailid(),prd.getMacaddress(),new String(spwd));
	}
	public List<Product> getProducts(String username){
		System.out.println("get products");
		List<Product> prds=ado.getJtemplate().query("select macaddr from userproducttable where emailid=?",new Object[]{username},new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int rownum) throws SQLException{
				Product ns=new Product();
				ns.setMacaddress((String)rs.getString("macaddr"));
				ns.setDescription("");
				ns.setName("");
				ns.setUname("");
				return ns;
			}
		});
		return prds;
	}
}

package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.jdbc.core.RowMapper;

import Model.Customer;
import Model.Network;
import Model.Product;

public class ProductDao extends DatabaseDao {
	public void insertProduct(Product prd){
		mongoOperation.insert(prd,"products");
	}
	public void productdelete(Product prd){
		String pid = prd.getProductID();
		Query searchUserQuery = new Query(Criteria.where("productID").is(pid));
		mongoOperation.findAndRemove(searchUserQuery, Product.class,"products");
	}
	public List<Product> fetchAllproducts(){
		List<Product> prds= mongoOperation.findAll(Product.class, "products");
		return prds;
	}
}

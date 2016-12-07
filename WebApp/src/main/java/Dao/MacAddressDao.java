package Dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Component
@Repository
public class MacAddressDao {
	@Autowired
	static private DataSource dataSource;
	@Autowired
	static private JdbcTemplate jtemplate;
	public void setDataSource(DataSource datasource)
	{try{
		this.dataSource=datasource;
		System.out.println("inside data source");
		System.out.println(this.dataSource);
		this.jtemplate=new JdbcTemplate(datasource);
		System.out.println(this.jtemplate);
		System.out.println(this.dataSource.getConnection());
	}catch(Exception e){}}
	public void setJdbctemplate(JdbcTemplate jdbctemplate) 
	{
		this.jtemplate = jdbctemplate;
	}
	
	public boolean validateMacAddress(String address){
		boolean valid=false;
		System.out.println(this.dataSource);
		System.out.println(this.jtemplate);
		List<String> addlist=this.jtemplate.queryForList("select macadd from passwordTable", String.class);
		System.out.println(addlist);
		if(!addlist.contains(address)||addlist==null)
			valid=false;
		else
			valid=true;
		return valid;
	}
}

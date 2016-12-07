package Dao;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Component
@Repository
public class DatabaseDao {
	@Autowired
	static public DataSource dataSource;
	@Autowired
	static public JdbcTemplate jtemplate;
	
	public static JdbcTemplate getJtemplate() {
		return jtemplate;
	}

	public static void setJtemplate(JdbcTemplate jtemplate) {
		DatabaseDao.jtemplate = jtemplate;
	}

	public static DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource ds)
	{
		try
		{
			dataSource=ds;
			System.out.println("inside data source");
			System.out.println(this.dataSource);
			this.jtemplate=new JdbcTemplate(dataSource);
		}
		catch(Exception e)
		{}
	}
}

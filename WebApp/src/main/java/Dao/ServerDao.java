package Dao;

import org.springframework.beans.factory.annotation.Autowired;

import Model.Server;

public class ServerDao extends DatabaseDao{
	@Autowired
	private DatabaseDao ado;
	public int insertServerDetails(Server s){
		return ado.getJtemplate().update("insert into servertable values(?,?)",s.getUserId(),s.getServerPassword());
	}
}

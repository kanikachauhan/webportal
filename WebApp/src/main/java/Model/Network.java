package Model;

import java.util.ArrayList;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
@Document(collection = "networks")
public class Network {
	@Id
	private String networkID;
	private String networkName;
	private String admin;
	private String timer;
	private ArrayList<Customer> users;
	
	public String getNetworkID() {
		return networkID;
	}
	public void setNetworkID(String networkID) {
		this.networkID = networkID;
	}
	public String getNetworkName() {
		return networkName;
	}
	public void setNetworkName(String networkName) {
		this.networkName = networkName;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getTimer() {
		return timer;
	}
	public void setTimer(String timer) {
		this.timer = timer;
	}
	public ArrayList getUsers() {
		return users;
	}
	public void setUsers(ArrayList users) {
		this.users = users;
	}
	@Override
	public String toString(){
		return "{\"networkID\":\""+networkID+"\",\"networkName\":\""+networkName+"\",\"admin\":\""+admin+"\",\"timer\":\""+timer+"\""
				+ ",\"users\":\""+users+"\"}";	
		}
}

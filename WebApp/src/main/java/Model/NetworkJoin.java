package Model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "NetworkJoin")
public class NetworkJoin {
	@Id
	private String tt;
	private String name;
	private String email;
	private String ownflag;
	private String joinflag;
	public String getName() {
		return name;
	}
	public String getTt() {
		return tt;
	}
	public void setTt(String tt) {
		this.tt = tt;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOwnflag() {
		return ownflag;
	}
	public void setOwnflag(String ownflag) {
		this.ownflag = ownflag;
	}
	public String getJoinflag() {
		return joinflag;
	}
	public void setJoinflag(String joinflag) {
		this.joinflag = joinflag;
	}
	@Override
	public String toString(){
		return "{\"name\":\""+name+"\",\"email\":\""+email+"\",\"ownflag\":\""+ownflag+"\",\"joinflag\":\""+joinflag+"\"}";
	}
}

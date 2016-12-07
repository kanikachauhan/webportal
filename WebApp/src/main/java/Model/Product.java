package Model;

import javax.servlet.http.Part;


public class Product {
	private String macaddress;
	private String name;
	private String description;
	//private Part img;
	private String uname;
	private String pid;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getMacaddress() {
		return macaddress;
	}
	public void setMacaddress(String macaddress) {
		this.macaddress = macaddress;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	/*public Part getImg() {
		return img;
	}
	public void setImg(Part img) {
		this.img = img;
	}*/
}

package Model;

import javax.servlet.http.Part;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "products")
public class Product {
	private String productID;
	private String name;
	private String description;
	private String macAddress;
	
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
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
	public String getMacAddress() {
		return macAddress;
	}
	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}
	@Override
	public String toString(){
		return "{\"productID\":\""+productID+"\",\"name\":\""+name+"\",\"description\":\""+description+"\",\"macAddress\":\""+macAddress+"\"}";
	}
}

package Model;

import java.util.ArrayList;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
@Document(collection = "users")
public class Customer {
		private String customerID;
		private String name;
		private String email;
		private String password;
		private String firstLoginFlag;
		private String phoneNumber;
		private String address;
		private String macAddress;
		private String clientPassword;
		private String role;
		private ArrayList products;
		private ArrayList joinedNetwork;
		private ArrayList createdNetwork;
		private String status;
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public ArrayList getJoinedNetwork() {
			return joinedNetwork;
		}
		public void setJoinedNetwork(ArrayList joinedNetwork) {
			this.joinedNetwork = joinedNetwork;
		}
		public ArrayList getCreatedNetwork() {
			return createdNetwork;
		}
		public void setCreatedNetwork(ArrayList createdNetwork) {
			this.createdNetwork = createdNetwork;
		}
		public String getCustomerID() {
			return customerID;
		}
		public void setCustomerID(String customerID) {
			this.customerID = customerID;
		}
		public String getName() {
			return name;
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
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getFirstLoginFlag() {
			return firstLoginFlag;
		}
		public void setFirstLoginFlag(String firstLoginFlag) {
			this.firstLoginFlag = firstLoginFlag;
		}
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getMacAddress() {
			return macAddress;
		}
		public void setMacAddress(String macAddress) {
			this.macAddress = macAddress;
		}
		public String getClientPassword() {
			return clientPassword;
		}
		public void setClientPassword(String clientPassword) {
			this.clientPassword = clientPassword;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		
		
		@Override
		public String toString(){
			return "{\"customerID\":\""+customerID+"\",\"name\":\""+name+"\",\"email\":\""+email+"\","
					+ "\"password\":\""+password+"\",\"firstLoginFlag\":\""+firstLoginFlag+"\",\"address\":\""+address+"\",\"phoneNumber\":\""+phoneNumber+"\""
							+ ",\"role\":\""+role+"\",\"macAddress\":\""+macAddress+"\",\"clientPassword\":\""+clientPassword+"\","
									+ "\"products\":"+products+"}"
					;
		}
		public ArrayList getProducts() {
			return products;
		}
		public void setProducts(ArrayList products) {
			this.products = products;
		}
}

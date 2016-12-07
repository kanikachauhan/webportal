package Model;

public class Customer {
		
		private String customerid;
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		private String firstname;
		private String middlename;
		private String lastname;
		private String emailid;
		private String password;
		private String contactno;
		private String address;
		private String macaddress;
		private String role;
		public Customer(String customerid, String firstname, String middlename,
				String lastname, String emailid, String password,
				String contactno, String address,String role) {
			super();
			this.customerid = customerid;
			this.firstname = firstname;
			this.middlename = middlename;
			this.lastname = lastname;
			this.emailid = emailid;
			this.password = password;
			this.contactno = contactno;
			this.address = address;
			this.role = role;
		}
		public String getCustomerid() {
			return customerid;
		}
		
		public String getFirstname() {
			return firstname;
		}
		public String getLastname() {
			return lastname;
		}
		public String getEmailid() {
			return emailid;
		}
		public String getPassword() {
			return password;
		}
		public String getContactno() {
			return contactno;
		}
		public String getMiddlename() {
			return middlename;
		}
		public String getAddress() {
			return address;
		}
		public String getMacaddress() {
			return macaddress;
		}
		
}

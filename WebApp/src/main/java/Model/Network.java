package Model;

public class Network {
	private String networkname;
	private String creatername;
	private String connectorname;
	private String status;
	private String userstatus;
	private String networkId;
	private String ownerFlag;
	private String joinFlag;
	public String getOwnerFlag() {
		return ownerFlag;
	}
	public void setOwnerFlag(String ownerFlag) {
		this.ownerFlag = ownerFlag;
	}
	public String getJoinFlag() {
		return joinFlag;
	}
	public void setJoinFlag(String joinFlag) {
		this.joinFlag = joinFlag;
	}
	public String getNetworkId() {
		return networkId;
	}
	public void setNetworkId(String networkId) {
		this.networkId = networkId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserstatus() {
		return userstatus;
	}
	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}
	public String getNetworkname() {
		return networkname;
	}
	public void setNetworkname(String networkname) {
		this.networkname = networkname;
	}
	public String getCreatername() {
		return creatername;
	}
	public void setCreatername(String creatername) {
		this.creatername = creatername;
	}
	public String getConnectorname() {
		return connectorname;
	}
	public void setConnectorname(String connectorname) {
		this.connectorname = connectorname;
	}
	
}

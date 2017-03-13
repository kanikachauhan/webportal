package Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.CriteriaDefinition;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.mongodb.WriteResult;

import Model.Customer;
import Model.Network;
import Model.NetworkJoin;
import Model.Product;

public class ServerDao extends DatabaseDao{
	//1
	public List<Network> allnetworks(){
		List<Network> prds= new ArrayList<Network>();
		List<Network> aa = mongoOperation.findAll(Network.class, "networks");
		if(aa!=null)
			prds = aa;
		return prds;
	}
	//2
	public List<Network> getjoinednetworksforcurrentuser(Customer cst){
		List<Network> prds = new ArrayList<Network>();
		Query q = new Query(Criteria.where("email").is(cst.getEmail()));
		Customer cc = mongoOperation.findOne(q, Customer.class,"users");
		List<String> ss = cc.getJoinedNetwork();
		System.out.println("joined networks");
		System.out.println(ss);
		if(ss!=null){
			for(int i=0;i<ss.size();i++){
				Query q2 = new Query(Criteria.where("networkName").is(ss.get(i)));
				Network nsd = mongoOperation.findOne(q2, Network.class,"networks");
				if(nsd!=null)
					prds.add(nsd);
			}
		}
		return prds;
	}
//public boolean checkpresent(Network nj,String uname){
//	boolean flag = false;
//	try{
//		Query searchProductQuery = new Query(Criteria.where("networkName").is(nj.getNetworkName()));
//		System.out.println(nj.getNetworkName());
//		Network nnj = mongoOperation.findOne(searchProductQuery, Network.class,"networks");
//		System.out.println(nnj);
//		System.out.println("obtained network "+nnj.getNetworkName());
//		ArrayList<Customer> ast = nnj.getUsers();
//		if(ast!=null){
//			for(int i=0;i<ast.size();i++){
//				if(ast.get(i).getEmail().equals(uname)&&ast.get(i).getStatus().equals("false")){
//					flag = true;
//					break;
//				}
//			}
//		}return flag;
//	}catch(Exception e){
//		e.printStackTrace();
//		return flag;
//	}
//	}
public int request(Network nj,String username){
	//get existing user lists
	Query searchProductQuery = new Query(Criteria.where("networkName").is(nj.getNetworkName()));
	System.out.println(nj.getNetworkName());
	Network nnj = mongoOperation.findOne(searchProductQuery, Network.class,"networks");
	System.out.println(nnj);
	System.out.println("obtained network "+nnj.getNetworkName());
	ArrayList<Customer> ast = nnj.getUsers();
		Customer cstobj = new Customer();
		cstobj.setEmail(username);
		cstobj.setStatus("false");
		Query qct = new Query(Criteria.where("email").is(username));
		Customer newobj = mongoOperation.findOne(qct, Customer.class);
		cstobj.setName(newobj.getName());
		if(ast==null)
		{
			ast = new ArrayList<Customer>();
			ast.add(cstobj);
		}else{
			ast.add(cstobj);
		}
		Update upd = new Update();
		upd.set("users", ast);
		WriteResult wr = mongoOperation.updateFirst(searchProductQuery, upd, Network.class);
		if(wr!=null)
			return 1;
		else
			return 0;
}
	public List<Network> fetchNetworktb(Network nj){
		Query searchProductQuery = new Query(Criteria.where("admin").is(nj.getAdmin()));
		List<Network> njj = mongoOperation.find(searchProductQuery, Network.class, "networks");
		return njj;
	}
	public boolean deletenetwork(String[] nt){
		try{
				for(int t=0;t<nt.length;t++){
				Network n = new Network();
				n.setNetworkName(nt[t]);
				Query searchProductQuery = new Query(Criteria.where("networkName").is(n.getNetworkName()));
				System.out.println(n.getNetworkName());
				mongoOperation.findAndRemove(searchProductQuery,Network.class,"networks");
				Query searchnjQuery = new Query(Criteria.where("networkName").is(n.getNetworkName()));
				List<Customer> csts = mongoOperation.findAll(Customer.class);
				for(int i=0;i<csts.size();i++){
					Customer sss = csts.get(i);
					List<String> createdlist = sss.getCreatedNetwork();
					if(createdlist!=null){
						if(createdlist.contains(n.getNetworkName()))
							{
								createdlist.remove(n.getNetworkName());
							}
					}
					List<String> joinedlist = sss.getJoinedNetwork();
					if(joinedlist!=null){
						if(joinedlist.contains(n.getNetworkName())){
							joinedlist.remove(n.getNetworkName());
						}
					}
					Update upd = new Update();
					upd.set("createdNetwork", createdlist);
					upd.set("joinedNetwork", joinedlist);
					Query searchn = new Query(Criteria.where("email").is(sss.getEmail()));
					WriteResult wr = mongoOperation.updateFirst(searchn, upd, Customer.class);
				} 	
			}
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public int joinnetwork(Network nw,String email){
		/**network updated to true**/
		int count = 0;
		Query searchUserQuery = new Query(Criteria.where("networkName").is(nw.getNetworkName()));
		Network getObj = mongoOperation.findOne(searchUserQuery, Network.class);
		List<Customer> getcstlst = getObj.getUsers();
		List<Customer> newgetcstlst = new ArrayList<Customer>();
		for(int i=0;i<getcstlst.size();i++){
			Customer c = getcstlst.get(i);
			if(c.getEmail().equals(email)){
				c.setStatus("true");
			}
			newgetcstlst.add(c);
		}
		Update update = new Update();
		update.set("users", newgetcstlst);
		WriteResult wr = mongoOperation.updateFirst(searchUserQuery, update, Network.class);
		if(wr!=null)
			count++;
		/**joined network list updated**/
		Query searchQuery = new Query(Criteria.where("email").is(email));
		Customer cst = mongoOperation.findOne(searchQuery, Customer.class);
		List<String> joinednetworkList = cst.getJoinedNetwork();
		joinednetworkList.add(nw.getNetworkName());
		Update ud = new Update();
		ud.set("joinedNetwork", joinednetworkList);
		WriteResult wrt = mongoOperation.updateFirst(searchQuery, ud, Customer.class);
		if(wrt!=null)
			count++;
		return count;
	}
	public int cancelledrequest(Network nj,String email){
		/**cancel the request**/
		Query searchUserQuery = new Query(Criteria.where("networkName").is(nj.getNetworkName()));
		//System.out.println(n);
		Network getObj = mongoOperation.findOne(searchUserQuery, Network.class);
		System.out.println(getObj.getNetworkName());
		List<Customer> lst = getObj.getUsers();
		System.out.println("before list "+lst);
		for(int i=0;i<lst.size();i++){
			Customer csr = lst.get(i);
			//System.out.println(csr.getEmail());
			if(csr.getEmail().equals(email)){
				lst.remove(i);
			}
		}
		System.out.println("after list "+lst);
		Update ud = new Update();
		ud.set("users", lst);
		WriteResult wr  = mongoOperation.updateFirst(searchUserQuery, ud, Network.class);
		if(wr!=null)
			return 2;
		else
			return 0;
	}
	public void savetimer(Network nw){
		try{
		Query searchUserQuery = new Query(Criteria.where("networkName").is(nw.getNetworkName()));
		Network getObj = mongoOperation.findOne(searchUserQuery, Network.class);
		System.out.println(nw.getNetworkName());
		Update update = new Update();
		update.set("timer", nw.getTimer());
		System.out.println(nw.getTimer());
		WriteResult wr = mongoOperation.updateFirst(searchUserQuery, update, Network.class);
		System.out.println(wr);
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	public List<Network> fetchNetworkdata(String nj){
		/**have to change**//*
		boolean eligflag = false;
		List<Network> eliglist = new ArrayList();
		List<Network> nwt = mongoOperation.findAll(Network.class);
		for(int i=0;i<nwt.size();i++){
			Network ntt = nwt.get(i);
			List<Customer> cstlst = ntt.getUsers();
			eligflag = false;
			if(cstlst!=null){
				if(cstlst.size()!=0){
					for(int j=0;j<cstlst.size();j++){
						Customer ss = cstlst.get(j);
						if(ss.getEmail().equals(nj)&&ss.getStatus().equals("true")){
							eligflag = true;
							break;
						}
					}
					if(eligflag = true)
						eliglist.add(ntt);
				}
			}
		}
		System.out.println("eligible list");
		System.out.println(eliglist);
		return eliglist;*/
		List<Network> eliglist = new ArrayList<Network>();
		List<Network> alllist  = mongoOperation.findAll(Network.class);
		for(int i=0;i<alllist.size();i++){
			Network n = alllist.get(i);
			List<Customer> a= n.getUsers();
			if(a!=null){
				for(int j=0;j<a.size();j++){
					Customer c = a.get(j);
					if(c.getEmail().equals(nj))
					{
						eliglist.add(n);
					}
				}
			}
		}
		return eliglist;
	}
	public List<Network> fetchNetworkjoin(NetworkJoin nj){
		/**have to change**/
		System.out.println(nj.getEmail());
		List<Network> newlst = new ArrayList<Network>();
		Query searchProductQuery = new Query(Criteria.where("admin").is(nj.getEmail()));
		List<Network> njj = mongoOperation.find(searchProductQuery, Network.class, "networks");
			System.out.println("network for whom the user is amdin");
		if(njj!=null)
			newlst = njj;
		return newlst;
	}
	public List<Network> getMembers(Network nj){
		/**have to change**/
/*		Query searchProductQuery = new Query(Criteria.where("networkName").is(nj.getNetworkName()));
		Network njj = mongoOperation.findOne(searchProductQuery, Network.class, "Network");
	*/	List<Network> lst = new ArrayList<Network>();
		lst = mongoOperation.findAll(Network.class);
		return lst;
	}
	//one
	public void leavenetwork(String[] arr,String email){
		/**leave a network or remove a member from list**/
		for(int j=0;j<arr.length;j++){
			Network nw = new Network();
			nw.setNetworkName(arr[j]);
		Query searchProductQuery = new Query(Criteria.where("networkName").is(nw.getNetworkName()));
		Network nnw = mongoOperation.findOne(searchProductQuery, Network.class,"networks");
		List<Customer> emails = nnw.getUsers();
		System.out.println("before leaving "+emails);
		if(emails!=null){
			for(int i=0;i<emails.size();i++){
				Customer scs = emails.get(i);
				if(scs.getEmail().equals(email)){
					emails.remove(i);
				}
			}
		}
		System.out.println("after leaving "+emails);
	/*	Update up = new Update();
		up.set("users", emails);
		WriteResult wr = mongoOperation.updateFirst(searchProductQuery, up, Network.class);
		*/Query searchnppQuery = new Query(Criteria.where("email").is(email));
		Customer updacst = mongoOperation.findOne(searchnppQuery, Customer.class,"users");
		List<String> kst = updacst.getJoinedNetwork();
		
		System.out.println(kst);
		if(kst!=null){
			for(int i=0;i<kst.size();i++){
				if(kst.get(i).equals(nw.getNetworkName())){
					kst.remove(i);
				}
			}
		}/*
		Update upd = new Update();
		upd.set("joinedNetworks", kst);
		WriteResult wrt = mongoOperation.updateFirst(searchnppQuery, upd, Network.class);*/
	}
	}
}

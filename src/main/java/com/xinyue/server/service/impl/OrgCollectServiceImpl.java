package com.xinyue.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.dao.CityStationDao;
import com.xinyue.manage.dao.OrganizationDao;
import com.xinyue.manage.dao.OrganizationTypeDao;
import com.xinyue.manage.dao.ProductTypeDao;
import com.xinyue.manage.model.Organization;
import com.xinyue.manage.model.OrganizationType;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.model.SubStation;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.OrgCollectBean;
import com.xinyue.server.dao.OrgCollectDao;
import com.xinyue.server.model.OrgCollect;
import com.xinyue.server.service.OrgCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @下午4:04:27
 */
@Service
public class OrgCollectServiceImpl implements OrgCollectService {

	@Resource
	private OrgCollectDao odao;
	
	@Override
	public PageData<OrgCollect> findPage(OrgCollectBean orgCollect) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(orgCollect.getTopage()) || "0".equals(orgCollect.getTopage())?1:Integer.valueOf(orgCollect.getTopage());
		int total = odao.getOrgTotal(orgCollect);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		//add by lzc
		List<OrgCollect> oList = odao.findPage(orgCollect, start, GlobalConstant.PAGE_SIZE);
		for (OrgCollect collect : oList) {
			Organization o = orgdao.findShop(collect.getId());
			collect.setBusinessType(o.getPtype());
			collect.setBusinessAreas(o.getStat());
		}
		//end by lzc
		
		
		return new PageData<OrgCollect>(oList, total, currentPage);
	}


	@Override
	public boolean delOrgCollect(List<Integer> list) {
		// TODO Auto-generated method stub
		int s = odao.delOrgCollect(list);
		if(s == 1){
			return true;
		}
		return false;
	}

	@Override
	public OrgCollect showDetail(int id) {
		// TODO Auto-generated method stub
		return odao.showDetail(id);
	}
	
	@Resource
	private OrganizationDao orgdao;
	
	@Override
	public PageData<Organization> findOrgPage(OrgCollectBean orgCollect) {
		// TODO Auto-generated method stub
		String topage = orgCollect.getTopage();
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		List<Organization> data = odao.findOrgPage(orgCollect, start, GlobalConstant.PAGE_SIZE);
		for (Organization org : data) {
			Organization o = orgdao.findShop(org.getId());
			org.setStat(o.getStat());
			org.setPtype(o.getPtype());
		}
		int count = odao.getOrgCount(orgCollect);
		return new PageData<Organization>(data , count, currentPage); 
	}

	@Override
	public Organization findOrgById(String orgid) {
		// TODO Auto-generated method stub
		return orgdao.findShop(orgid);//odao.findOrgById(orgid);
	}
	
	@Override
	public List<Product> findProByBank(String orgid) {
		// TODO Auto-generated method stub
		return odao.findProByBank(orgid);
	}
	
	@Override
	public List<SuccessCase> findCaseByPro(List<Product> product) {
		// TODO Auto-generated method stub
		return odao.findCaseByPro(product);
	}
	
	@Override
	public PageData<Product> findPageProByBank(String orgid, String topage) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Product>(odao.findPageProByBank(orgid , start , GlobalConstant.PAGE_SIZE), odao.getProByBankCount(orgid), currentPage);
	}
	
	
	@Override
	public PageData<SuccessCase> findPageCaseByPro(String orgid, String topage) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		List<Product> list = odao.findProByBank(orgid);
		return new PageData<SuccessCase>(odao.findPageCaseByPro(list, start, GlobalConstant.PAGE_SIZE), odao.getCaseByProCount(list), currentPage);
		
	}
	
	@Override
	public PageData<Question> findPageAdvisory(String orgid, String title,
			String topage) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Question>(
				odao.findPageAdvisory(orgid, title, start, GlobalConstant.PAGE_SIZE), 
				odao.getPageAdvisory(orgid, title), 
				currentPage);
	}
	
	@Resource
	private ProductTypeDao ptdao;
	@Override
	public List<ProductType> findByStatus() {
		// TODO Auto-generated method stub
		
		return ptdao.findProductTypeByList();
	}
	
	@Resource
	private OrganizationTypeDao otdao;
	@Override
	public List<OrganizationType> findOrgTypes() {
		// TODO Auto-generated method stub
		return otdao.findTypes();
	}
	
	@Resource
	private CityStationDao cdao;
	@Override
	public List<SubStation> findAllStation() {
		// TODO Auto-generated method stub
		return cdao.findAllStation();
	}
	
	
	@Override
	public List<OrgCollect> findOrgList() {
		// TODO Auto-generated method stub
		return odao.findOrgList(14);
	}
}

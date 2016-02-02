package com.xinyue.manage.service.impl;

import static org.junit.Assert.*;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xinyue.manage.model.FastProductApplicant;
import com.xinyue.manage.model.FastProductCompany;
import com.xinyue.manage.service.OrderService;

/**
 * author lzc
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/resources/conf/spring-mvc.xml"
		,"file:src/main/resources/conf/spring-mybatis.xml"})
public class OrderServiceImplTest {
	
	
	@Resource
	private OrderService orderService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		FastProductApplicant applicant = new FastProductApplicant();
		FastProductCompany company = new FastProductCompany();
		applicant.setLoanAmount(1019.0);
		applicant.setLoanPeriod("0");
		applicant.setProfession("0");
		applicant.setMonthCashIncome(0.0);
		applicant.setMonthManagement(0.0);
		applicant.setManagementLife("0");
		applicant.setRegisterProvince("110000");
		applicant.setRegisterZone("110101");
		applicant.setRegisterCity("110100");
		applicant.setTwoYearCredit("0");
		applicant.setHouseType("0");
		
		company.setCompanyName("0");
		company.setLegalRepresentative("0");
		company.setPapersNumber("0");
		company.setParpersType("0");
		company.setPersonInformation("0");
		company.setBusinessLicenseNumber("0");
		company.setRegisterAddress("0");
		company.setRegisterFund(250.0);
		company.setRegisterTime(new Date());
		company.setIndustry("0");
		company.setCompanyType("0");
		company.setStaffNumber("0");
		company.setYearNetProfit(250.0);
		company.setFactBusinessArea("0");
		try {
			String tel = "18768104912";
			String manageId = "";
			String productId = "product";
			String session = manageId+"&"+tel+"&"+productId;
			orderService.addFastOrderTypeTwo(session, applicant,company);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("done");
		fail("Not yet implemented");
	}

}

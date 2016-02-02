package com.xinyue.server.controller.member;

import static org.junit.Assert.fail;

import java.util.UUID;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerMapping;

import com.xinyue.manage.dao.OrderDAO;
import com.xinyue.manage.model.Order;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.util.SericalNumber;

/**
 * author lzc
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/resources/conf/spring-mvc.xml"
		,"file:src/main/resources/conf/spring-mybatis.xml"})
public class OrderControllerTest extends AbstractTransactionalJUnit4SpringContextTests {
	
	
	private static HandlerMapping handler; 
	private static HandlerAdapter handlerAdapter;  
	
	
	
	// 模拟request,response  
    private MockHttpServletRequest request;  
    private MockHttpServletResponse response;
    
    private MockMvc mockmvc;
    
    @Autowired
    private OrderController OrderController;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
//		request = new MockHttpServletRequest();      
//        request.setCharacterEncoding("UTF-8");      
//        response = new MockHttpServletResponse();  
//        OrderController orderController = new OrderController();
////        mockmvc = MockMvcBuilder
        
		
	}
	
	@Resource 
	private OrderService OrderService;
	
	@Resource
	private OrderDAO OrderDAO;

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAddOrder()  {
		Order order = new Order();
		order.setProductInfo("d8d5a7352cfb11e5a2d6d0278858a399");
		order.setProductInfo("5c7c0fbe1a3c11e5a2d6d0278858a399");
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		order.setId(uuid);
		order.setCreatedId("3");
		order.setModifiedId("3");
		order.setMemberId("3");
		order.setCreditManagerId("444");
		order.setCode(SericalNumber.getInstance().generaterNextNumber());
		order.setApplicatPerson("李志超");
		order.setLinkPhone("13555555555");
		order.setBank("455");
//		order.setApplicantSave(0);
//		order.setBusinessSave(0);
//		order.setCompanySave(0);
//		order.setDebtSave(0);
//		order.setDocumentSave(0);
//		order.setStatus("0");
		try {
			OrderService.addOrder(order);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(0);
		fail("Not yet implemented");
	}

}

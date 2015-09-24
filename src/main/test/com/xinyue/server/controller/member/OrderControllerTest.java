//package com.xinyue.server.controller.member;
//
//import static org.junit.Assert.*;
//
//import javax.annotation.Resource;
//
//import org.junit.After;
//import org.junit.AfterClass;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mock.web.MockHttpServletRequest;
//import org.springframework.mock.web.MockHttpServletResponse;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.MockMvcBuilder;
//import org.springframework.test.web.servlet.RequestBuilder;
//import org.springframework.web.servlet.HandlerAdapter;
//import org.springframework.web.servlet.HandlerMapping;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;
//
//import com.sun.net.httpserver.Filter.Chain;
//import com.xinyue.manage.service.CompanyInfoService;
//import com.xinyue.manage.service.MemberService;
//import com.xinyue.manage.service.OrderService;
//import com.xinyue.manage.service.ProductService;
//import com.xinyue.manage.service.SelectService;
//import com.xinyue.server.service.CommonService;
//
///**
// * author lzc
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"file:src/main/resources/conf/spring-mvc.xml","file:src/main/resources/conf/spring-mybatis.xml"})
//public class OrderControllerTest extends AbstractTransactionalJUnit4SpringContextTests {
//	
//	
////	private static HandlerMapping handler; 
////	private static HandlerAdapter handlerAdapter;  
//	
//	
//	
//	// 模拟request,response  
//    private MockHttpServletRequest request;  
//    private MockHttpServletResponse response;
//    
//    private MockMvc mockmvc;
//    
//    @Autowired
//    private OrderController OrderController;
//
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//		
//	}
//
//	@AfterClass
//	public static void tearDownAfterClass() throws Exception {
//	}
//
//	@Before
//	public void setUp() throws Exception {
//		request = new MockHttpServletRequest();      
//        request.setCharacterEncoding("UTF-8");      
//        response = new MockHttpServletResponse();  
//        OrderController orderController = new OrderController();
////        mockmvc = MockMvcBuilder
//        
//		
//	}
//
//	@After
//	public void tearDown() throws Exception {
//	}
//
//	@Test
//	public void testAddOrder()  {
//		MockHttpServletRequest request = new MockHttpServletRequest();
//		MockHttpServletResponse response = new MockHttpServletResponse();
//		request.setRequestURI("order/add");
//		request.addParameter("memberid", "00022B625DF943AB934299050C5D6F43");
//		request.addParameter("productid", "15BAF241AFA84930B4B4B49B05FB247F");
//		request.addParameter("manageid", "3");
//System.out.println(OrderController);
////System.out.println(handlerAdapter);
//		try {
////			this.mockmvc.perform()
////			ModelAndView mav = handlerAdapter.handle(request, response, )
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		
//		fail("Not yet implemented");
//	}
//
//}

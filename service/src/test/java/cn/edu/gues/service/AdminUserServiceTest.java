package cn.edu.gues.service; 

import org.junit.Test; 
import org.junit.Before; 
import org.junit.After;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;

/** 
* AdminUserService Tester. 
* 
* @author <wsichao> 
* @since <pre>May 28, 2019</pre> 
* @version 1.0 
*/ 
public class AdminUserServiceTest {

    @Autowired
    private AdminUserService adminUserService;

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: login(String account, String password) 
* 
*/ 
@Test
public void testLogin() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: selectAllAndRole(AdminUserAndRole adminUserAndRole) 
* 
*/ 
@Test
public void testSelectAllAndRole() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: selectAllNextLevel(Role role, Role nextRole, List<Class> classList) 
* 
*/ 
@Test
public void testSelectAllNextLevel() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: newAdminUser(String name, String workId, String phone) 
* 
*/ 
@Test
public void testNewAdminUser() throws Exception { 
//TODO: Test goes here...

} 


} 

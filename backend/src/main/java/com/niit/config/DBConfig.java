package com.niit.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.niit.dao.*;
import com.niit.model.*;

@Configuration
@ComponentScan("com.niit")
@EnableTransactionManagement
public class DBConfig {
	
	static {
		System.out.println("DB Config class is loaded now!");
	}
	
	/* Method used to set the parameters for H2 connectivity */
	@Bean(name="dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource dataSource=new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:~/test");
		dataSource.setUsername("user");
		dataSource.setPassword("pass");
		System.out.println("---Data Source Created---");
		return dataSource;
	}
	
	/* Method to create the bean of SessionFactory with all model classes in session */
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory() {
		Properties hibernateProp=new Properties();
		
		hibernateProp.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProp.put("hibernate.dialect","org.hibernate.dialect.H2Dialect");
		hibernateProp.setProperty("hibernate.show_sql", "true");
		
		LocalSessionFactoryBuilder factoryBuilder=new LocalSessionFactoryBuilder(getH2DataSource());
		factoryBuilder.addAnnotatedClass(Category.class);
		factoryBuilder.addAnnotatedClass(Product.class);
		factoryBuilder.addAnnotatedClass(UserDetail.class);
		factoryBuilder.addAnnotatedClass(Supplier.class);
		factoryBuilder.addAnnotatedClass(CartItem.class);
		factoryBuilder.addAnnotatedClass(OrderDetail.class);
		factoryBuilder.addProperties(hibernateProp);
		
		System.out.println("Creating SessionFactory Bean");
		return factoryBuilder.buildSessionFactory();
	}
	
	/* Method to create the bean of CategoryDAO */
	@Bean(name="categoryDAO")
	public CategoryDAO getCategoryDAO()	{
		System.out.println("----CategoryDAO bean creation---");
		return new CategoryDAOImpl();
	}
	
	/* Method to create the bean of ProductDAO */
	@Bean(name="productDAO")
	public ProductDAO getProductDAO() {
		System.out.println("----ProductDAO bean creation---");
		return new ProductDAOImpl();
	}
	
	/* Method to create the bean of UserDetailDAO */
	@Bean(name="userDetailDAO")
	public UserDetailDAO getuserDetailDAO() {
		System.out.println("----UserDetailDAO bean creation---");
		return new UserDetailDAOImpl();
	}
	
	/* Method to create the bean of SupplierDAO */
	@Bean(name="supplierDAO")
	public SupplierDAO getSupplierDAO() {
		System.out.println("----Supplier DAO bean creation---");
		return new SupplierDAOImpl();
	}
	
	/* Method to create the bean of TransactionManager */
	@Bean(name="txManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		System.out.println("---Transaction Manager----");
		return new HibernateTransactionManager(sessionFactory);
	}
	
	/* Method to create the bean of CartItemDAO */
	@Bean(name="cartItemDAO")
	public CartItemDAO getCartItemDAO()	{
		System.out.println("----CartItemDAO bean creation---");
		return new CartItemDAOImpl();
	}
	
	/* Method to create the bean of OrderDetailDAO */
	@Bean(name="orderDetailDAO")
	public OrderDetailDAO getOrderDetailDAO()	{
		System.out.println("----OrderDetailDAO bean creation---");
		return new OrderDetailDAOImpl();
	}	
}
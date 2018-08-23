package com.test.config;

import javax.sql.DataSource;

import org.ff4j.FF4j;
import org.ff4j.core.Feature;
import org.ff4j.property.PropertyInt;
import org.ff4j.property.PropertyString;
import org.ff4j.springjdbc.store.EventRepositorySpringJdbc;
import org.ff4j.springjdbc.store.FeatureStoreSpringJdbc;
import org.ff4j.springjdbc.store.PropertyStoreSpringJdbc;
import org.ff4j.strategy.el.ExpressionFlipStrategy;
import org.ff4j.web.FF4jDispatcherServlet;
import org.ff4j.web.embedded.ConsoleServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnClass({ConsoleServlet.class, FF4jDispatcherServlet.class})
//@AutoConfigureAfter(FF4jConfiguration.class)
public class FF4JConfig {
	
	@Autowired
    private DataSource dataSource;
    	
		
	@Bean
	public ServletRegistrationBean ff4jDispatcherServletRegistrationBean(FF4jDispatcherServlet ff4jDispatcherServlet) 
	{
		ServletRegistrationBean bean = new ServletRegistrationBean(ff4jDispatcherServlet, "/ff4j-web-console/*");
		bean.setName("ff4j-console");
		bean.setLoadOnStartup(1);
		/*HashMap<String,String> initParameters = new<String, String>HashMap();
		initParameters.put("ff4jProvider", "com.test.FF4jProvider");
		
		bean.setInitParameters(initParameters);*/

		return bean;
	}

	@Bean
    @ConditionalOnMissingBean
    public FF4jDispatcherServlet getFF4jDispatcherServlet() {
        FF4jDispatcherServlet ff4jConsoleServlet = new FF4jDispatcherServlet();
        ff4jConsoleServlet.setFf4j(getFF4j());
        return ff4jConsoleServlet;
    }
	
	/**
	 * STANDALONE XML BASED EXAMPLE
	 */

	/*@Bean
	public FF4j getFF4j() { 
		
		FF4j ff4j = new FF4j("ff4j.xml");
		ff4j
		.createFeature("sasi-f1")
        .createFeature("Awesome-Sasi-1-Feature")
        .createFeature("f2").createFeature("sasi-f2")
        .createProperty(new PropertyString("SampleProperty", "go-sasi!"))
        .createProperty(new PropertyInt("SamplePropertyIn", 12));
		
		Feature exp = new Feature("exp-sasi");
        exp.setFlippingStrategy(new ExpressionFlipStrategy("exp-sasi", "f1 & f2 | !f1 | f2"));
        ff4j.createFeature(exp);
        
        
		return ff4j; 
	}*/
	
	/*@Bean
    public DataSource dataSource(CacheManager cacheManager) {
        log.info("Configuring JDBC datasource from a cloud provider");
        DataSource dataSource = connectionFactory().dataSource();
        return dataSource;
    }*/
	
    @Bean
    public FF4j getFF4j() 
    {
        FF4j ff4j = new FF4j();
        ff4j.setFeatureStore(new FeatureStoreSpringJdbc(dataSource));
        ff4j.setPropertiesStore(new PropertyStoreSpringJdbc(dataSource));
        ff4j.setEventRepository(new EventRepositorySpringJdbc(dataSource));
        
        ff4j.audit(true);
        
        // ADD FEATURES PROGRAMATICALLY
        
       /* ff4j
		.createFeature("sasi-f1")
        .createFeature("Awesome-Sasi-1-Feature")
        .createFeature("f2").createFeature("sasi-f2")
        .createProperty(new PropertyString("SampleProperty", "go-sasi!"))
        .createProperty(new PropertyInt("SamplePropertyIn", 12));
		
		Feature exp = new Feature("exp-sasi");
        exp.setFlippingStrategy(new ExpressionFlipStrategy("exp-sasi", "f1 & f2 | !f1 | f2"));
        ff4j.createFeature(exp);*/
        
        return ff4j;
    }

}

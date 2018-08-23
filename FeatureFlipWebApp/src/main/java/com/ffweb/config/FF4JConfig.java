package com.ffweb.config;

import javax.sql.DataSource;

import org.ff4j.FF4j;
import org.ff4j.springjdbc.store.EventRepositorySpringJdbc;
import org.ff4j.springjdbc.store.FeatureStoreSpringJdbc;
import org.ff4j.springjdbc.store.PropertyStoreSpringJdbc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.dialect.IDialect;
import org.thymeleaf.spring4.SpringTemplateEngine;
import org.thymeleaf.spring4.templateresolver.SpringResourceTemplateResolver;

import com.ffweb.thymeleaf.MyFF4JDialect;

@Configuration
public class FF4JConfig 
{
    @Qualifier("ff4jDataSource")
    @Autowired
    private DataSource dataSource;
    
    @Autowired
    SpringResourceTemplateResolver srt;
    
    @Bean
    public FF4j getFF4j() {
        
        /*BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUsername("root");
        dataSource.setPassword("12345");
        dataSource.setUrl("jdbc:mysql://localhost:3306/demo_webapp");
*/
        
        FF4j ff4j = new FF4j();
        ff4j.setFeatureStore(new FeatureStoreSpringJdbc(dataSource));
        ff4j.setPropertiesStore(new PropertyStoreSpringJdbc(dataSource));
        ff4j.setEventRepository(new EventRepositorySpringJdbc(dataSource));
        
        ff4j.audit();
        
         // Enable Cache Proxy
         //ff4j.cache(new InMemoryCacheManager());
        
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

    @Bean
    public SpringTemplateEngine templateEngine(){
        SpringTemplateEngine templateEngine = new SpringTemplateEngine();       
        templateEngine.setTemplateResolver(srt);
        MyFF4JDialect dialect = new MyFF4JDialect();
        dialect.setFF4J(getFF4j());
        templateEngine.addDialect(dialect);
        return templateEngine;
    }
    
}

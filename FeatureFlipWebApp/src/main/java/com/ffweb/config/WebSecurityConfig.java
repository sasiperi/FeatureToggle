package com.ffweb.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
//@EnableWebSecurity(debug=true)
@EnableWebSecurity
public class WebSecurityConfig extends  WebSecurityConfigurerAdapter
{
   /* @Autowired
    private AccessDeniedHandler accessDeniedHandler;*/
    
    @Autowired
    private DataSource dataSource;
    
       @Override
       protected void configure(HttpSecurity http) throws Exception
       {
             http.csrf().disable()
                 .authorizeRequests()            
                     .antMatchers("/css/**","/fonts/**","/images/**","/js/**","/favicon.ico","/img/**","/font/**","/ff4j-web-console/**").permitAll()
                     //.antMatchers("/**").hasAnyRole("USER","ADMIN")
                     .antMatchers("/","/index","/personList","/addPerson","/addPerson").hasAnyRole("USER","ADMIN")
                     .antMatchers("/removePerson","/modifyPerson").hasRole("ADMIN")
                     .anyRequest().authenticated()
                   .and()
                   .formLogin()
                       .loginPage("/login").permitAll()
                   .and().logout().permitAll();
                       //.logout().logoutUrl("/logout").permitAll().logoutSuccessUrl("/login");
                       //.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
       }
       
       @Override
       protected void configure(AuthenticationManagerBuilder auth) throws Exception 
       {
           auth
             .jdbcAuthentication()
             .dataSource(dataSource)
             .passwordEncoder(new BCryptPasswordEncoder());  
       }
             
      /* @Bean
       public UserDetailsService userDetailsService() {
           InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
           manager.createUser(User.withUsername("user").password("password")
               .roles("USER").build());
           return manager;
       }*/
}
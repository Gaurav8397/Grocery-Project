package com.grocery.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * @author Gaurav Mahajan
 *
 */
@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan("com.grocery")
@EnableJpaRepositories(basePackages="com.grocery.repository")
@EnableTransactionManagement
@EntityScan(basePackages="com.grocery.entity")
@EnableCaching
public class GroceryStroreApplication implements WebMvcConfigurer{

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SpringApplication.run(GroceryStroreApplication.class, args);
	}

	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		registry.viewResolver(resolver);
	}
}

package com.disney;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	private String connectPath = "/images/**";
	
	private String resourcePath = "file:///C:\\Users\\user1\\git\\disneyDongsan\\disneyDongsan\\src\\main\\resources\\static\\images\\";
	
	@Override
	public void addResourceHandlers (ResourceHandlerRegistry registry) {
		registry.addResourceHandler(connectPath)
				.addResourceLocations(resourcePath);
	}

}

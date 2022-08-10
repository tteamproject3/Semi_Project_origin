package com.campus.myapp;

import java.util.Collections;

import org.apache.catalina.Context;
import org.apache.tomcat.util.descriptor.web.JspConfigDescriptorImpl;
import org.apache.tomcat.util.descriptor.web.JspPropertyGroup;
import org.apache.tomcat.util.descriptor.web.JspPropertyGroupDescriptorImpl;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SemiprojectApplication.class);
	}
<<<<<<< HEAD:Semiproject/src/main/java/com/campus/myapp/ServletInitializer.java
 
=======
	
>>>>>>> d84aca60ec232897feac6831e202b0e6cd3aa2f7:Semiproject/src/main/java/com/campus/myapp/vo/ServletInitializer.java
	@Bean
	public ConfigurableServletWebServerFactory configurableServletWebServerFactory() {
		return new TomcatServletWebServerFactory() {
		
		@Override
		protected void postProcessContext(Context context) {
			super.postProcessContext(context);
			JspPropertyGroup jspPropertyGroup = new JspPropertyGroup();
				
			jspPropertyGroup.addUrlPattern("*.jsp");
			jspPropertyGroup.addUrlPattern("*.jspf");
			jspPropertyGroup.setPageEncoding("UTF-8");
			jspPropertyGroup.setScriptingInvalid("true");
			jspPropertyGroup.addIncludePrelude("/WEB-INF/views/inc/top.jspf");
			jspPropertyGroup.addIncludeCoda("/WEB-INF/views/inc/bottom.jspf");
			jspPropertyGroup.setTrimWhitespace("true");
			jspPropertyGroup.setDefaultContentType("text/html");
				
			JspPropertyGroupDescriptorImpl jspPropertyGroupDescriptor = new JspPropertyGroupDescriptorImpl(jspPropertyGroup);
			context.setJspConfigDescriptor(new JspConfigDescriptorImpl(Collections.singletonList(jspPropertyGroupDescriptor), Collections.emptyList()));
				
				
			}	

		};
		
	}	

}

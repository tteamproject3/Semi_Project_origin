package com.novicecoders.ontheway;

import java.util.Collections;//

import org.apache.catalina.Context;
import org.apache.tomcat.util.descriptor.web.JspConfigDescriptorImpl;
import org.apache.tomcat.util.descriptor.web.JspPropertyGroup;//
import org.apache.tomcat.util.descriptor.web.JspPropertyGroupDescriptorImpl;//
import org.springframework.boot.builder.SpringApplicationBuilder;//
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;//
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;//
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;//
import org.springframework.context.annotation.Bean;//
import org.springframework.stereotype.Component;///

//Spring의 Web.xml파일을 대신하는 파일
@Component
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(OnTheWayApplication.class);
	}
	@Bean
	public ConfigurableServletWebServerFactory configurableServletWebServerFactory() {
		return new TomcatServletWebServerFactory() {
			@Override
			protected void postProcessContext(Context context) {
				super.postProcessContext(context);
				JspPropertyGroup jspPropertyGroup= new JspPropertyGroup();
				//프로퍼티를 적용할 JSP 파일의 URL 패턴을 지정
				jspPropertyGroup.addUrlPattern("*.jsp");	
				jspPropertyGroup.addUrlPattern("*.jspf");
				
				jspPropertyGroup.setPageEncoding("UTF-8");
				jspPropertyGroup.setScriptingInvalid("true");
				
				//태그에 지정한 패턴에 해당하는 JSP 파일의 앞에 삽입할 파일을 지정
				jspPropertyGroup.addIncludePrelude("/WEB-INF/views/inc/header.jspf");
				//뒤에 삽입할 파일을 지정
				jspPropertyGroup.addIncludeCoda("/WEB-INF/views/inc/footer.jspf");
				
				jspPropertyGroup.setTrimWhitespace("true");
				jspPropertyGroup.setDefaultContentType("text/html");
				JspPropertyGroupDescriptorImpl jspPropertyGroupDescriptor = new JspPropertyGroupDescriptorImpl(jspPropertyGroup);
				context.setJspConfigDescriptor(new JspConfigDescriptorImpl(Collections.singletonList(jspPropertyGroupDescriptor), Collections.emptyList()));
				
			}
		};
	}

}

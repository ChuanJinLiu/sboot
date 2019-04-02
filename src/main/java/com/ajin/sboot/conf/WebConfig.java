package com.ajin.sboot.conf;

import org.apache.catalina.filters.RemoteIpFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Japoul
 */

@Configuration
public class WebConfig {
    @Bean
    public RemoteIpFilter remoteIpFilter() {
        return new RemoteIpFilter();
    }

    @Bean
    public FilterRegistrationBean testFilterRegistration() {

        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new MyFilter());
        registration.addUrlPatterns("/*");
        registration.addInitParameter("paramName", "paramValue");
        registration.setName("MyFilter");
        registration.setOrder(1);
        return registration;
    }

    public class MyFilter implements Filter {
        @Override
        public void destroy() {
            // TODO Auto-generated method stub
        }

        @Override
        public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain filterChain)
                throws IOException, ServletException {
            // TODO Auto-generated method stub
            HttpServletRequest request = (HttpServletRequest) srequest;
            System.out.println("请求的路径 :" + request.getRequestURI());
            boolean vlogin = request.getSession().getAttribute("heroList") == null;
            //是否需要进行拦截 true为需要 false为不需要
            boolean vUrl = false;
            String url = request.getRequestURI();
            List<String> urls = new ArrayList<>();
//            urls.add("/index");
//            urls.add("/immediateTasks");
//            urls.add("/overTasks");
            for (String v_url : urls) {
                if (v_url.equals(url)) {
                    vUrl = true;
                    break;
                }
            }
            if (vlogin && vUrl) {
                request.setAttribute("flag", "error");
                request.getRequestDispatcher("/login").forward(request, sresponse);
            }

            filterChain.doFilter(srequest, sresponse);
        }

        @Override
        public void init(FilterConfig arg0) throws ServletException {
            // TODO Auto-generated method stub
        }
    }
}
package com.robot.cose.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("http://localhost:4000","https://react-template-three-nu.vercel.app/") // 프론트엔드 주소
                .allowedMethods("GET", "POST", "PUT", "DELETE");

        registry.addMapping("/kakao/**")
                .allowedOrigins("http://localhost:4000", "https://react-template-three-nu.vercel.app/")
                .allowedMethods("GET", "POST");

    }
}

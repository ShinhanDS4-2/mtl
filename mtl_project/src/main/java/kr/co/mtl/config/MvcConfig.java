package kr.co.mtl.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.zaxxer.hikari.HikariDataSource;

import kr.co.mtl.interceptor.LoginInterceptor;
import kr.co.mtl.interceptor.PartnerLoginInterceptor;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "kr.co.mtl")
@MapperScan(basePackages = {"kr.co.mtl"}, annotationClass = Mapper.class)
@EnableTransactionManagement
@PropertySource("classpath:application.properties")
public class MvcConfig implements WebMvcConfigurer {
	
	// DB 설정값
	@Value("${spring.datasource.driver-class-name}")
	private String driver;
	
	@Value("${spring.datasource.url}")
	private String url;
	
	@Value("${spring.datasource.username}")
	private String username;
	
	@Value("${spring.datasource.password}")
	private String password;
	
	@Value("${aws.access-key}")
	private String ACCESS_KEY;
	
	@Value("${aws.secret-key}")
	private String SECRET_KEY;
	
	@Value("${email.username}")
	private String emailUsername;

	@Value("${email.password}")
	private String emailPassword;
	
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	// HikariCP
	@Bean
	public DataSource dataSource() {
		
		HikariDataSource dataSource = new HikariDataSource();
		
		dataSource.setDriverClassName(driver);
		dataSource.setJdbcUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		
		return dataSource;
	}
	
	// MyBatis
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource()); 
		
		return ssf.getObject();
	}
	
	// 트랜잭션 
	@Bean
	public TransactionManager tm() {
		DataSourceTransactionManager dtm = new DataSourceTransactionManager(dataSource());
		
		return dtm;
	}
	
	// 사용자 인터셉터
	@Bean
	public LoginInterceptor interception() {
		return new LoginInterceptor();
	}
	
	// 파트너 인터셉터
	@Bean
    public PartnerLoginInterceptor partnerInterceptor() {
        return new PartnerLoginInterceptor();
    }
	
	// 인터셉터 설정
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 사용자
		registry.addInterceptor(interception())
			.addPathPatterns("/mypage/**", "/reservation", "reservationConfirm")
			.excludePathPatterns("/login", "/join", "/resources/**", "/assets/**", "/error"); // 예외 경로
		
		// 파트너
		registry.addInterceptor(partnerInterceptor())
        .addPathPatterns("/partner/**") // 파트너 경로
        .excludePathPatterns("/partner/login", "/partner/join", "/resources/**", "/assets/**", "/error"); // 예외 경로
	}
	
	// 정적 페이지 처리
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) { 
		configurer.enable();
	}
	
	// S3 설정
	@Bean
    public S3Client s3Client() {
        return S3Client.builder()
                .region(Region.AP_NORTHEAST_2) // 원하는 AWS 리전을 설정
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(ACCESS_KEY, SECRET_KEY)))
                .build();
        
	}
	
	@Bean
    public JavaMailSender mailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername(emailUsername);
        mailSender.setPassword(emailPassword);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }
	
	@Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 최대 업로드 크기: 10MB
        return multipartResolver;
    }
}

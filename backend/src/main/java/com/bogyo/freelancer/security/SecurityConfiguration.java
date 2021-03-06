package com.bogyo.freelancer.security;

import com.bogyo.freelancer.repository.UserRepository;
import com.bogyo.freelancer.security.jwt.AuthorizationResponse;
import com.bogyo.freelancer.security.jwt.JwtCookieStore;
import com.bogyo.freelancer.security.jwt.JwtTokenAuthenticationFilter;
import com.bogyo.freelancer.security.jwt.JwtUsernameAndPasswordAuthenticationFilter;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

@Configuration
@EnableWebSecurity
@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private static final String SECRET_PROPERTY_NAME = "security.jwt.secret";

    @Autowired
    private Environment environment;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private CustomAuthenticationProvider authProvider;

    @Autowired
    UserRepository userRepository;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    private static void handleException(HttpServletRequest req, HttpServletResponse rsp, AuthenticationException e)
            throws IOException {
        PrintWriter writer = rsp.getWriter();
        writer.println(new ObjectMapper().writeValueAsString(new AuthorizationResponse("error", "Unauthorized")));
        rsp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //String secret = environment.getProperty(SECRET_PROPERTY_NAME);
        http = http.cors().and().csrf().disable();
        String secret = "pasd";
        JwtCookieStore jwtCookieStore = new JwtCookieStore(secret.getBytes() , userRepository);
        http.csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .exceptionHandling().authenticationEntryPoint(SecurityConfiguration::handleException)
                .and()
                .addFilter(new JwtUsernameAndPasswordAuthenticationFilter(jwtCookieStore, authenticationManager()))
                .addFilterAfter(new JwtTokenAuthenticationFilter(jwtCookieStore ,userRepository), UsernamePasswordAuthenticationFilter.class)
                .authorizeRequests()
                //.antMatchers(HttpMethod.GET, "/**").permitAll()
                .antMatchers(HttpMethod.POST, "/api/v1/user").permitAll()
                .antMatchers(HttpMethod.POST, "/api/v1/auth").permitAll()
                .antMatchers(HttpMethod.GET, "/swagger-ui.html").permitAll()
                .antMatchers(HttpMethod.GET,  "/swagger-resources/**").permitAll()
                .antMatchers(HttpMethod.GET,  "/v2/api-docs").permitAll()
                .antMatchers(HttpMethod.GET,  "/configuration/ui").permitAll()
                .antMatchers(HttpMethod.GET,  "/webjars/**").permitAll()

                .antMatchers(HttpMethod.GET,  "/swagger-ui/**").permitAll()

                .antMatchers(HttpMethod.GET,  "/swagger-resources/**").permitAll()
                .antMatchers(HttpMethod.GET, "/").permitAll()
                .antMatchers(HttpMethod.GET, "/*.js", "/*.css", "/*.png", "/*.html", "/*.ttf", "/assets/**").permitAll()
                //.antMatchers(HttpMethod.GET, "/api/v1/user").permitAll()
                /*.antMatchers("/**").hasRole("USER")
                .antMatchers("/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST,"/**").hasRole("USER")*/
                .anyRequest().authenticated();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source =
                new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.setAllowedOrigins(List.of("http://localhost:4200","http://127.0.0.1:4200/"));
        config.addAllowedHeader("*");
        System.out.println(config.getAllowedHeaders());
        config.addAllowedMethod(HttpMethod.GET);
        config.addAllowedMethod(HttpMethod.POST);
        config.addAllowedMethod(HttpMethod.DELETE);
        config.addAllowedMethod(HttpMethod.PUT);
        config.validateAllowCredentials();
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("*"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}
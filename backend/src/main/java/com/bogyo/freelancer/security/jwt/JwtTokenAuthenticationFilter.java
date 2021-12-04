package com.bogyo.freelancer.security.jwt;

import com.bogyo.freelancer.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JwtTokenAuthenticationFilter extends OncePerRequestFilter {

    private JwtCookieStore jwtCookieStore;

    private UserRepository userRepository;

    public JwtTokenAuthenticationFilter(JwtCookieStore jwtCookieStore , UserRepository ur) {
        this.jwtCookieStore = jwtCookieStore;
        this.userRepository = ur;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain chain) throws ServletException, IOException {

        try {
            jwtCookieStore.retrieveToken(request)
                    .ifPresent(auth -> SecurityContextHolder.getContext().setAuthentication(auth));
        } catch (Exception e) {
            SecurityContextHolder.clearContext();
        }

        chain.doFilter(request, response);

    }
}
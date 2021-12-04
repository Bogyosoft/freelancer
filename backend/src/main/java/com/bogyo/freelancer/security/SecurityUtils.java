package com.bogyo.freelancer.security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class SecurityUtils {

    public String getLoggedInUsername(){
        return SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
    }

    public String getLoggedInUserAuthorities(){
        return SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().toString();
    }


}

package com.example.freelancer.repository

import com.example.freelancer.model.User


class testRepository{
    fun checkLogin(email: String, password: String): Boolean {
        return true;
        return ("email" == email && "password" == password)
    }
    fun register(newUser : User) :Boolean{
        return true
    }
}
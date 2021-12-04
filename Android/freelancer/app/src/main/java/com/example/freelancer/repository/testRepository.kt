package com.example.freelancer.repository

import com.example.freelancer.model.UserItem


class testRepository{
    fun checkLogin(email: String, password: String): Boolean {
        return ("email" == email && "password" == password)
    }
    fun register(newUser : UserItem) :Boolean{
        return false
    }
}
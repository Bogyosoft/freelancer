package com.example.freelancer

import com.example.freelancer.model.UserItem

object ActiveUser{
    fun getActiveUser():UserItem{
        return user
        return UserItem(id = 3, username = "qq", password = "q",role = "ROLE_USER",score = 0 )
    }
    lateinit var user: UserItem
    lateinit var token:String
    lateinit var username:String
}
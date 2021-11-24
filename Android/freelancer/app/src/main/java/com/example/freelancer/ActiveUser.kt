package com.example.freelancer

import com.example.freelancer.model.UserItem

object ActiveUser{
    fun getActiveUser():UserItem{
        return UserItem(id = 1, username = "IOS",password = "ios",role = "king",score = 0 )
    }
    lateinit var token:String
}
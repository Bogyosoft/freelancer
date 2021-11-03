package com.example.freelancer.model

data class UserItem(
    val id: Int,
    val password: String,
    val role: String,
    val score: Int,
    val username: String
)
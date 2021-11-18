package com.example.freelancer.model

import androidx.compose.runtime.Composable
import androidx.navigation.NavController

data class Source(
    val id: Int,
    val location: String,
    val owner: UserItem
)
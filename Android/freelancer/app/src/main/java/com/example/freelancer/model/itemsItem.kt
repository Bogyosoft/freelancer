package com.example.freelancer.model

import androidx.compose.runtime.Composable
import androidx.navigation.NavController

data class itemsItem(
    val destination: String,
    val id: Int,
    val properties: String,
    val source: Source,
    val status: String
)
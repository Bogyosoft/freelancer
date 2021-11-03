package com.example.freelancer.ui.screens.details

import androidx.compose.foundation.layout.Column
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import com.example.freelancer.model.UserItem

@Composable
fun UserDetails(userItem: UserItem){
    Column() {
        Text(text = userItem.username)
        Text(text = userItem.password)
        Text(text = userItem.role)
        Text(text = userItem.score.toString())

    }


}
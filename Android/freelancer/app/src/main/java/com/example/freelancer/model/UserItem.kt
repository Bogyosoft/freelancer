package com.example.freelancer.model

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController

data class UserItem(
    val id: Int,
    val password: String,
    val role: String,
    val score: Int,
    val username: String
):IItem {
    @Composable
    override fun ListViewItem(
        navController: NavController,
        userItem: IItem,
        onItemClicked: (item: IItem) -> Unit
    ) {
        Card(modifier = Modifier
            .padding(8.dp)
            .clickable {
                onItemClicked(userItem)
                navController.navigate("userDetails")
            }
            .fillMaxWidth()) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(text = (userItem as UserItem ).username)
            }
        }
    }
}



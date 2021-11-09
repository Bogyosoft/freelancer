package com.example.freelancer.model

import androidx.compose.runtime.Composable
import androidx.navigation.NavController

data class Source(
    val id: Int,
    val location: String,
    val owner: UserItem
):IItem {
    @Composable
    override fun ListViewItem(
        navController: NavController,
        item: IItem,
        onItemClicked: (item: IItem) -> Unit
    ) {
        TODO("Not yet implemented")
    }
}
package com.example.freelancer.model

import androidx.compose.runtime.Composable
import androidx.navigation.NavController

data class jobItem(
    val freelancer: UserItem,
    val id: Int,
    val item: itemsItem
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
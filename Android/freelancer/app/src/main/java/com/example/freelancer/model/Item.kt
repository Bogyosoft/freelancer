package com.example.freelancer.model

import androidx.compose.runtime.Composable
import androidx.navigation.NavController

interface IItem {
    @Composable
    fun ListViewItem(
        navController: NavController,
        item: IItem,
        onItemClicked: (item: IItem) -> Unit
    )
}
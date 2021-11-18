package com.example.freelancer.model

import android.telecom.Call
import androidx.compose.foundation.layout.Column
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.navigation.NavController

interface IItem {
    @Composable
    fun ListViewItem(
        navController: NavController,
        item: IItem,
        onItemClicked: (item: IItem) -> Unit
    )
    @Composable
    fun Details(item: IItem)
}
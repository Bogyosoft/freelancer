package com.example.freelancer.model

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
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
        Card(modifier = Modifier
            .padding(8.dp)
            .clickable {
                onItemClicked(item)
                navController.navigate("jobDetails")
            }
            .fillMaxWidth()
            .width(Dp(350F))
            .height(Dp(400F)),
            backgroundColor = Color.Red,
            shape = RoundedCornerShape(50.dp)
        )
        {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(text = (item as jobItem ).id.toString())
            }
        }
    }
    @Composable
    override fun Details(item: IItem) {
        Column() {
            item as jobItem
            Text(text = item.freelancer.username)
            Text(text = item.item.status)
            Text(text = item.item.properties)

        }
    }
}
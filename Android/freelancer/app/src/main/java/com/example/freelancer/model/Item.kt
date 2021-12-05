package com.example.freelancer.model

import android.util.Log
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.ButtonDefaults
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.freelancer.ActiveUser
import com.example.freelancer.ui.screens.rndColor
import com.example.freelancer.ui.viewmodel.JobViewModel

data class Item(
    val destination: String,
    val id: Int,
    val properties: String,
    val source: Source,
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
                navController.navigate("itemsDetails")
            }
            .fillMaxWidth()
            .width(Dp(350F))
            .height(Dp(600F)),
            border = BorderStroke(2.dp, Color.Red),
            shape = RoundedCornerShape(50.dp),
            elevation = Dp.Hairline
            ,backgroundColor = rndColor()
        )
        {
            Row(
                verticalAlignment = Alignment.Top,
                horizontalArrangement = Arrangement.Center
            ) {
                Text(text = (item as Item ).destination,
                    textAlign = TextAlign.Center,
                    fontSize = 31.sp,
                    modifier = Modifier
                        .padding(25.dp)
                        .offset(
                            x = 2.dp,
                            y = 2.dp
                        )
                        .width(300.dp)
                        .border(
                            width = 2.dp,
                            color = Color.White,
                            shape = RoundedCornerShape(50.dp)
                        )
                        .padding(15.dp)
                )

            }
        }
    }
    @Composable
    override fun Details(
        item: IItem,
        navController: NavController?

    ) {
        val mod = Modifier
            .padding(0.dp)
            .width(300.dp)
            .border(width = 2.dp, color = Color.White, shape = RoundedCornerShape(50.dp))
            .padding(15.dp)
        item as Item


        Card(modifier = Modifier
            .padding(15.dp)
            .fillMaxWidth()
            .width(Dp(350F))
            .height(Dp(800F))
            //.alpha(0.7f)
            ,
            border = BorderStroke(2.dp,Color.Red),
            shape = RoundedCornerShape(50.dp),
            elevation = Dp.Hairline
            ,backgroundColor = rndColor())
        {
            Column() {
                CustomText(title = "sender:", text =item.source.owner.username , mod = mod )
                CustomText(title = "destination:", text =item.destination , mod = mod )
                CustomText(title = "properties:", text =item.properties , mod = mod )
                //CustomText(title = "status:", text =item.status , mod = mod )
                Spacer(modifier = Modifier.height(150.dp))
                Button(
                    onClick = {
                        val job = JobItem(ActiveUser.getActiveUser(),0,this@Item,"??")
                        Log.d("item content",this@Item.destination)
                        val jobViewModel = JobViewModel()
                        jobViewModel.createJobs(this@Item)
                        navController?.navigate("Main")
                    },
                    colors = ButtonDefaults.buttonColors(backgroundColor = rndColor()),
                    modifier = Modifier
                        .padding(10.dp)
                        .fillMaxWidth()
                        .border(
                            width = 2.dp,
                            color = Color.White,
                            shape = RoundedCornerShape(50.dp)
                        )
                        .height(50.dp),
                    shape = RoundedCornerShape(50.dp)


                    ) {
                    Text(text = "Take job", color = Color.White)

                }
            }

        }

    }
}
package com.example.freelancer.model

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
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
import com.example.freelancer.ui.screens.rndColor

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
        iItem: IItem,
        onItemClicked: (item: IItem) -> Unit
    ) {
        Card(modifier = Modifier
            .padding(8.dp)
            .clickable {
                onItemClicked(iItem)
                navController.navigate("userDetails")
            }
            .fillMaxWidth()
            .width(Dp(350F))
            .height(Dp(600F))
            //.alpha(0.7f)
            ,
            border = BorderStroke(2.dp,Color.Red),
            shape = RoundedCornerShape(50.dp),
            elevation = Dp.Hairline
            ,backgroundColor = rndColor()
        )
        {
            Row(
                verticalAlignment = Alignment.Top,
                horizontalArrangement = Arrangement.Center
            ) {
                Text(text = (iItem as UserItem ).username,
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
        item as UserItem


            Card(modifier = Modifier
                .padding(15.dp)
                .fillMaxWidth()
                .width(Dp(350F))
                .height(Dp(800F))
                //.alpha(0.7f)
                ,
                border = BorderStroke(2.dp,Color.Red),
                shape = RoundedCornerShape(50.dp),
                elevation = Dp.Hairline,
                backgroundColor = rndColor()
            )
            {
                Column() {
                    CustomText(title = "username:", text =item.username , mod = mod )
                    CustomText(title = "password:", text =password , mod = mod )
                    CustomText(title = "role:", text =item.role , mod = mod )
                    CustomText(title = "score:", text =item.score.toString() , mod = mod )
                }
            }


    }
}


@Composable
fun CustomText(title:String,text:String,mod:Modifier){
    Spacer(Modifier.size(20.dp))

    Column(modifier = Modifier.padding(20.dp)) {
        Text(text=title,modifier = Modifier.padding(start = 20.dp),color = Color.White)
        Text(text = text,modifier = mod,textAlign = TextAlign.Center,
            fontSize = 20.sp,color = Color.White)
    }
    Spacer(Modifier.size(5.dp))


}
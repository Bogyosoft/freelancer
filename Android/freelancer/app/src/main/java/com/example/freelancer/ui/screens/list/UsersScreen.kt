package com.example.freelancer.ui.screens

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.constraintlayout.widget.Placeholder
import androidx.navigation.NavController
import com.example.freelancer.model.IItem
import com.example.freelancer.ui.viewmodel.IViewModel


@ExperimentalFoundationApi
@Composable
fun MainList(navController: NavController,
             viewModel: IViewModel){
    UserList(
        navController = navController, list = viewModel.list,
        onItemClicked = (viewModel::itemClicked)
    )
}



@ExperimentalFoundationApi
@Composable
fun UserList(
    navController: NavController,
    list: List<IItem>,
    onItemClicked: (IItem) -> Unit
) {
    val listState = rememberLazyListState()


    MainHeader()
    Spacer(Modifier.size(200.dp))
    Column(modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ){
        LazyRow(state = listState,
            verticalAlignment = Alignment.Bottom

        )
        {

            itemsIndexed(list){ index, item ->
                item.ListViewItem(navController = navController, item = item,onItemClicked)
            }
        }

    }

}


@Composable
fun MainHeader(){
    Surface(
        Modifier
            .fillMaxWidth()
            .background(MaterialTheme.colors.background)

    ) {
        Text(
        text = "Users",
            style = MaterialTheme.typography.h4,
            textAlign = TextAlign.Center,
            fontSize = 40.sp,
            color = Color.White,
            modifier = Modifier
                .alpha(0.7f)
                .background(Color.Red)
                .padding(10.dp)

        )
    }
}

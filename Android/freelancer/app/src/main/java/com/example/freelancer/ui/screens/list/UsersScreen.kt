package com.example.freelancer.ui.screens

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.navigation.NavController
import com.example.freelancer.model.IItem
import com.example.freelancer.ui.viewmodel.IViewModel


@ExperimentalFoundationApi
@Composable
fun MainList(navController: NavController,
             viewModel: IViewModel){
    UserList(
        navController = navController, list = viewModel.list,
        onItemClicked = IViewModel::itemClicked as (item:IItem) ->Unit
    )
}

@ExperimentalFoundationApi
@Composable
fun UserList(
    navController: NavController,
    list:List<IItem>,
    onItemClicked: (item:IItem) ->Unit
){
    val listState = rememberLazyListState()
    val Red = Color(red=35,green = 61,blue = 83)

    LazyColumn(state = listState) {
        stickyHeader {
            MainHeader()
        }
        itemsIndexed(list){ index, item ->
            item.ListViewItem(navController = navController, item = item,onItemClicked)
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
            text = "Users:",
            style = MaterialTheme.typography.h4,
            textAlign = TextAlign.Center
        )
    }
}

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
import com.example.freelancer.model.UserItem
import com.example.freelancer.ui.parts.ListViewItem
import com.vyns.mvvmjetpackcomposesample.ui.viewmodel.UsersViewModel



@ExperimentalFoundationApi
@Composable
fun MainList(navController: NavController,
             usersViewModel: UsersViewModel){
    UserList(navController = navController,userList = usersViewModel.userList,
        onItemClicked = usersViewModel::itemClicked)
}

@ExperimentalFoundationApi
@Composable
fun UserList(
    navController: NavController,
    userList:List<UserItem>,
    onItemClicked:(item:UserItem) ->Unit
){
    var listState = rememberLazyListState()
    val Red = Color(red=35,green = 61,blue = 83)

    LazyColumn(state = listState) {
        stickyHeader {
            MainHeader()
        }
        itemsIndexed(userList){ index, item ->
            ListViewItem(navController = navController,userItem = item,onItemClicked)
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

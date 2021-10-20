package com.example.freelancer.ui.screens

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.example.freelancer.R
import kotlinx.coroutines.Job

@Composable
fun MainScreen(navController: NavController, openDrawer: () -> Job){

    TopBar(onButtonClicked = {openDrawer()})
}



@Composable
fun TopBar(title: String = "", onButtonClicked: () -> Unit) {
    var showMenu by remember { mutableStateOf(false) }

    TopAppBar(
        title = { Text("Freelancer") },
        navigationIcon = {
            IconButton(onClick = {onButtonClicked() }) {
                Icon(Icons.Default.Menu, "Menu")
            }
        },
        actions = {
            IconButton(onClick = { showMenu = !showMenu }) {
                Icon(Icons.Default.MoreVert,"")
            }
            DropdownMenu(
                expanded = showMenu,
                onDismissRequest = { showMenu = false }
            ) {
                DropdownMenuItem(onClick = { /*TODO*/ }) {
                    Icon(Icons.Filled.Refresh,"")
                }
                DropdownMenuItem(onClick = { /*TODO*/ }) {
                    Icon(Icons.Filled.Call,"")
                }
            }
        }
    )
}

sealed class DrawerScreens(val title: String, val route: String) {
    object Login : DrawerScreens("Login", "Login")
}

private val screens = listOf(
    DrawerScreens.Login,

)

@Composable
fun Drawer(
    modifier: Modifier = Modifier,
    onDestinationClicked: (route: String) -> Unit
) {
    Column(
        modifier
            .fillMaxSize()
            .padding(start = 24.dp, top = 48.dp)
    ) {
        Image(
            painter = painterResource(R.drawable.ic_launcher_foreground),
            contentDescription = "App icon"
        )
        screens.forEach { screen ->
            Spacer(Modifier.height(24.dp))
            Text(
                text = screen.title,
                style = MaterialTheme.typography.h4,
                modifier = Modifier.clickable {
                    onDestinationClicked(screen.route)
                }
            )
        }
    }
}

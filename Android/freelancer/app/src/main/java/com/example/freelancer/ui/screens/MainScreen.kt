package com.example.freelancer.ui.screens

import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Call
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.MoreVert
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.freelancer.R
import kotlinx.coroutines.Job
import java.util.concurrent.ThreadLocalRandom

object Colors{
    var colors = ArrayList<Color>()
    fun initColors(){
        for (i in 0..3){
            colors.add( rndColor())
        }
    }


}
@Composable
fun MainScreen(navController: NavController, openDrawer: () -> Job){


    TopBar(onButtonClicked = {openDrawer()})
        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row() {
                GridItem(navController = navController, navTo = "Items", title = "Get a job!", Colors.colors[0])
                GridItem(navController = navController, navTo = "JobList", title = "View your jobs!",Colors.colors[1])

            }
            Row() {
                GridItem(navController = navController, navTo = "CreateJob", title = "Post a job!",Colors.colors[2])
                GridItem(navController = navController, navTo = "UserList", title = "View other users",Colors.colors[3])

            }
        }




}




@Composable
fun GridItem(navController:NavController, navTo:String, title:String, color:Color){

    val infiniteTransition = rememberInfiniteTransition()
    val size by infiniteTransition.animateFloat(
        initialValue = 180f,
        targetValue = 200f,
        animationSpec = infiniteRepeatable(
            animation = tween(800, delayMillis = ThreadLocalRandom.current().nextInt(150, 350),easing = FastOutLinearInEasing),
            repeatMode = RepeatMode.Reverse
        )
    )

    Card(modifier = Modifier
        .padding(8.dp)
        .clickable {
            navController.navigate(navTo)
        }
        .width(Dp(size))
        .height(Dp(size))
        //.alpha(ThreadLocalRandom.current().nextDouble(0.4, 0.9).toFloat())
        ,
        border = BorderStroke(2.dp, Color.Red),
        shape = RoundedCornerShape(50.dp),
        elevation = Dp.Hairline
        ,backgroundColor = color
    ){
        Text(text = title,
            textAlign = TextAlign.Center,
            fontSize = 31.sp,
            modifier = Modifier
                .padding(15.dp)
            ,color = Color.White
        )
    }
}

fun rndColor(): Color {
    return Color(10*ThreadLocalRandom.current().nextInt(20, 26)
        ,ThreadLocalRandom.current().nextInt(25, 60),
        ThreadLocalRandom.current().nextInt(25, 60),
        ThreadLocalRandom.current().nextInt(100, 255))
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
    object SignOut : DrawerScreens("SignOut", "SignOut")
    object Jobs : DrawerScreens("Jobs", "JobList")
    object Users : DrawerScreens("UserList", "UserList")
    object CreateJobs : DrawerScreens("Create Jobs", "CreateJob")
    object Items : DrawerScreens("Items","Items")

}

private val screens = listOf(
    DrawerScreens.SignOut,
    DrawerScreens.Users,
    DrawerScreens.Jobs,
    DrawerScreens.CreateJobs,
    DrawerScreens.Items
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

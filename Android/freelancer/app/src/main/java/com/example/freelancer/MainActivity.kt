package com.example.freelancer

import android.content.Context
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.os.Bundle
import android.view.WindowManager
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.material.DrawerValue
import androidx.compose.material.ModalDrawer
import androidx.compose.material.rememberDrawerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.freelancer.ui.screens.*
import com.example.freelancer.ui.theme.FreelancerTheme
import com.example.freelancer.ui.viewmodel.*
import kotlinx.coroutines.launch


class MainActivity : ComponentActivity() {
    companion object{
        lateinit var screen: String
    }

    @ExperimentalFoundationApi
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        screen = intent.getStringExtra("screen")!!

        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);

        setContent {
            FreelancerTheme {
                // A surface container using the 'background' color from the theme
                //LoginScreen()
                Freelancer(this)
            }
        }
    }
}
@ExperimentalFoundationApi
@Composable
fun Freelancer( context:Context){
    val registerViewModel = RegisterViewModel()
    val navController = rememberNavController()
    val userViewModel = UsersViewModel()
    val jobViewModel = JobViewModel()
    val loginViewModel = LoginViewModel()
    val itemViewModel = ItemViewModel()
    val drawerState = rememberDrawerState(DrawerValue.Closed)
    val scope = rememberCoroutineScope()
    val openDrawer = {
        scope.launch {
            drawerState.open()
        }
    }
    ModalDrawer(
        drawerState = drawerState,
        gesturesEnabled = drawerState.isOpen,
        drawerContent = {
            Drawer(
                onDestinationClicked = { route ->
                    scope.launch {
                        drawerState.close()
                    }
                    navController.navigate(route) {
                        popUpTo( navController.graph.startDestinationId)
                        launchSingleTop = true
                    }
                }
            )
        }
    ) {


        NavHost(navController = navController, startDestination = MainActivity.screen) {
            composable("Login") { LoginScreen(navController,loginViewModel) }
            composable("CreateJob") { CreateJobScreen(navController) }
            composable("Register") { RegisterScreen(navController,registerViewModel) }
            composable("Main") { MainScreen(navController,openDrawer) }

            composable("UserList"){ MainList(navController = navController, viewModel = userViewModel)}
            composable("userDetails"){ userViewModel.clickedItem.Details(item = userViewModel.clickedItem,navController)}

            composable("jobDetails"){ jobViewModel.clickedItem.Details(item = jobViewModel.clickedItem,navController)}
            composable("JobList"){MainList(navController = navController, viewModel = jobViewModel)}

            composable("itemsDetails"){ itemViewModel.clickedItem.Details(item = itemViewModel.clickedItem,navController)}
            composable("Items"){MainList(navController = navController, viewModel = itemViewModel)}

            composable("SignOut"){
                val i = Intent(context, StartActivity::class.java)
                i.flags=FLAG_ACTIVITY_NEW_TASK
                ActiveUser.token=""
                context.startActivity(i)
            }
        }
    }

}


@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    FreelancerTheme {
    }
}
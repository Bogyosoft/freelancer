package com.example.freelancer

import android.os.Bundle
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
import com.example.freelancer.repository.testRepository
import com.example.freelancer.ui.screens.*
import com.example.freelancer.ui.screens.details.UserDetails
import com.example.freelancer.ui.theme.FreelancerTheme
import com.example.freelancer.ui.viewmodel.RegisterViewModel
import com.vyns.mvvmjetpackcomposesample.ui.viewmodel.UsersViewModel
import kotlinx.coroutines.launch


class MainActivity : ComponentActivity() {
    companion object{
        val repo =testRepository()
    }
    private lateinit var screen: String
    private val viewModel = UsersViewModel()
    @ExperimentalFoundationApi
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        screen = intent.getStringExtra("screen")!!

        setContent {
            FreelancerTheme {
                // A surface container using the 'background' color from the theme
                //LoginScreen()
                Freelancer(viewModel = viewModel, screen = screen)
            }
        }
    }
}
@ExperimentalFoundationApi
@Composable
fun Freelancer(viewModel: UsersViewModel, screen: String){
    val registerViewModel = RegisterViewModel()
    val navController = rememberNavController()

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


        NavHost(navController = navController, startDestination = screen) {
            composable("Login") { LoginScreen(navController) }
            composable("Register") { RegisterScreen(navController,registerViewModel) }
            composable("Main") { MainScreen(navController,openDrawer) }
            composable("UserList"){ MainList(navController = navController, usersViewModel = viewModel)}
            composable("userDetails"){ UserDetails(userItem = viewModel.clickedItem)}
        }
    }

}



@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    FreelancerTheme {
    }
}
package com.example.freelancer

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
import com.example.freelancer.model.UserItem
import com.example.freelancer.repository.testRepository
import com.example.freelancer.ui.screens.*
import com.example.freelancer.ui.theme.FreelancerTheme
import com.example.freelancer.ui.viewmodel.JobViewModel
import com.example.freelancer.ui.viewmodel.LoginViewModel
import com.example.freelancer.ui.viewmodel.RegisterViewModel
import com.example.freelancer.ui.viewmodel.UsersViewModel
import kotlinx.coroutines.launch


class MainActivity : ComponentActivity() {
    companion object{
        val repo =testRepository()
    }
    private lateinit var screen: String
    @ExperimentalFoundationApi
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        screen = intent.getStringExtra("screen")!!

        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);

        setContent {
            FreelancerTheme {
                // A surface container using the 'background' color from the theme
                //LoginScreen()
                Freelancer(screen = screen)
            }
        }
    }
}
@ExperimentalFoundationApi
@Composable
fun Freelancer( screen: String){
    val registerViewModel = RegisterViewModel()
    val navController = rememberNavController()
    val userViewModel = UsersViewModel()
    val jobViewModel = JobViewModel()
    val loginViewModel = LoginViewModel()
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
            composable("Login") { LoginScreen(navController,loginViewModel) }
            composable("CreateJob") { CreateJobScreen(navController) }
            composable("Register") { RegisterScreen(navController,registerViewModel) }
            composable("Main") { MainScreen(navController,openDrawer) }

            composable("UserList"){ MainList(navController = navController, viewModel = userViewModel)}
            composable("userDetails"){ userViewModel.clickedItem.Details(item = userViewModel.clickedItem)}

            composable("jobDetails"){ jobViewModel.clickedItem.Details(item = jobViewModel.clickedItem)}
            composable("JobList"){MainList(navController = navController, viewModel = jobViewModel)}
        }
    }

}



@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    FreelancerTheme {
    }
}
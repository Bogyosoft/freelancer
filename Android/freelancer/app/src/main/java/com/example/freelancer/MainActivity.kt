package com.example.freelancer

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
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
import com.example.freelancer.ui.screens.Drawer
import com.example.freelancer.ui.screens.LoginScreen
import com.example.freelancer.ui.screens.MainScreen
import com.example.freelancer.ui.screens.RegisterScreen
import com.example.freelancer.ui.theme.FreelancerTheme
import kotlinx.coroutines.launch


class MainActivity : ComponentActivity() {
    companion object{
        val repo = testRepository()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            FreelancerTheme {
                // A surface container using the 'background' color from the theme
                //LoginScreen()
                Freelancer()
            }
        }
    }
}
@Composable
fun Freelancer(){
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

        NavHost(navController = navController, startDestination = "Login") {
            composable("Login") { LoginScreen(navController) }
            composable("Register") { RegisterScreen(navController) }
            composable("Main") { MainScreen(navController,openDrawer) }

        }
    }

}



@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    FreelancerTheme {
    }
}
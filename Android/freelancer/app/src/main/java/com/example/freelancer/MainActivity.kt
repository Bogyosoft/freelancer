package com.example.freelancer

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.freelancer.ui.screens.LoginScreen
import com.example.freelancer.ui.screens.RegisterScreen
import com.example.freelancer.ui.theme.FreelancerTheme



class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            FreelancerTheme {
                // A surface container using the 'background' color from the theme
                //LoginScreen()
                Freelancer()            }
        }
    }
}
@Composable
fun Freelancer(){
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = "Login") {
        composable("Login") {  LoginScreen(navController)}
        composable("Register") { RegisterScreen(navController) }
    }

}



@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    FreelancerTheme {
    }
}
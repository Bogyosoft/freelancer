package com.example.freelancer.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.freelancer.ui.fields.*

@Composable
fun RegisterScreen(navController: NavHostController) {

    val context = LocalContext.current
    val firstName = remember { mutableStateOf(TextFieldValue()) }
    val firstNameErrorState = remember { mutableStateOf(false) }

    val lastName = remember { mutableStateOf(TextFieldValue()) }
    val lastNameErrorState = remember { mutableStateOf(false) }

    val email = remember { mutableStateOf(TextFieldValue()) }
    val emailErrorState = remember { mutableStateOf(false) }

    val passwordErrorState = remember { mutableStateOf(false) }
    val password = remember { mutableStateOf(TextFieldValue()) }
    val passwordVisibility = remember { mutableStateOf(true) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center,
    ){
        title("Register")

        inputField(email,emailErrorState,"Email")

        passwordField(
            password = password,
            passwordVisibility = passwordVisibility,
            passwordErrorState = passwordErrorState
        )

        inputField(firstName,firstNameErrorState,"First name")
        inputField(lastName,lastNameErrorState,"Last name")


        navButton(
            passwordErrorState,
            password,
            email,
            emailErrorState,
            text = "Register",
            navController = navController
        )
        elseButton(text = "Login?", navController = navController)

    }

}
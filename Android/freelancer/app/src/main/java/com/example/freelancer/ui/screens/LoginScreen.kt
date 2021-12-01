package com.example.freelancer.ui.screens

import android.util.Log
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.freelancer.ActiveUser
import com.example.freelancer.MainActivity
import com.example.freelancer.model.UserDTO
import com.example.freelancer.model.UserItem
import com.example.freelancer.network.FreelancerAPIService
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import com.example.freelancer.ui.parts.elseButton
import com.example.freelancer.ui.parts.inputField
import com.example.freelancer.ui.parts.passwordField
import com.example.freelancer.ui.parts.title
import com.example.freelancer.ui.theme.PrimaryColor
import com.example.freelancer.ui.viewmodel.LoginViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.async
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

//https://medium.com/android-news/token-authorization-with-retrofit-android-oauth-2-0-747995c79720
@Composable
fun LoginScreen(navController: NavHostController,loginViewModel: LoginViewModel) {
    val context = LocalContext.current
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
    ) {
        title("Sign in")

        inputField(email,emailErrorState,"Email")

        passwordField(password,passwordVisibility,passwordErrorState)

        loginButton(passwordErrorState,password,email,emailErrorState,navController,loginViewModel)
        
        elseButton(text = "Register?",navController)
        
    }
}
/*
*
suspend fun login(userDTO: UserDTO):Boolean{
    val apiService = FreelancerApiClient.service
    var repository = FreeLancerRepository(apiService)


    val res = GlobalScope.async  {
        repository.login(userDTO) {
            if (it?.equals(null) ?: (true)) {
                Log.d("login model","failure ")
                return@login false
            } else {
                Log.d("login model","succes ")
                return@login true

            }
        }
    }

    return res.await()
}
* */

@Composable
fun loginButton(
    passwordErrorState: MutableState<Boolean>,
    password: MutableState<TextFieldValue>,
    email: MutableState<TextFieldValue>,
    emailErrorState: MutableState<Boolean>,
    navController: NavHostController,
    loginViewModel: LoginViewModel
)
{
    val (showDialog,setShowDialog) = remember { mutableStateOf(false)}
    loginDialog(showDialog,setShowDialog)
    Button(
        onClick = {
            when {
                email.value.text.isEmpty() -> {
                    emailErrorState.value = true
                }
                password.value.text.isEmpty() -> {
                    passwordErrorState.value = true
                }
                else -> {
                    passwordErrorState.value = false
                    emailErrorState.value = false

                   FreelancerApiClient.service.login(UserDTO(email.value.text,password.value.text))
                        .enqueue(object : Callback<UserDTO> {
                            override fun onFailure(call: Call<UserDTO>, t: Throwable) {
                                setShowDialog(true)
                            }
                            override fun onResponse(call: Call<UserDTO>, response: Response<UserDTO>) {
                                val user = response.body()

                                response.headers().get("Set-Cookie")?.let { Log.d("login token", it) }
                                ActiveUser.token =response.headers().get("Set-Cookie").toString()
                                Log.d("login", ActiveUser.token)
                                if(!ActiveUser.token.equals("null")){
                                    ActiveUser.user = UserItem(0,password.value.text,"",0,email.value.text)

                                    MainActivity.screen ="Main"
                                    navController.navigate("Main")
                                }
                                else setShowDialog(true)


                            }
                        })


                    /*
                    *
                    if(loginViewModel.loginUser(UserDTO(email.value.text,password.value.text))){
                        Log.d("navButton", "navigate")
                        MainActivity.screen ="Main"
                        navController.navigate("Main")
                    }
                    else{
                        setShowDialog(true)
                    }
                    * */

                }
            }
        },
        content = {
            Text(text = "Login", color = Color.White)
        },
        modifier = Modifier
            .fillMaxWidth()
            .height(50.dp),
        colors = ButtonDefaults.buttonColors(backgroundColor = PrimaryColor),
        shape = RoundedCornerShape(50.dp)
    )
    Spacer(Modifier.size(16.dp))


}

@Composable
fun loginDialog(showDialog: Boolean, setShowDialog: (Boolean) -> Unit) {
    if (showDialog) {
        AlertDialog(
            onDismissRequest = {
            },
            title = {
                Text(text = "Login faild", color = PrimaryColor)
            },
            confirmButton = {
                TextButton(
                    onClick = {
                        // Change the state to close the dialog
                        setShowDialog(false)
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .border(width = 2.dp, color = PrimaryColor, shape = RoundedCornerShape(50.dp))
                        .height(50.dp)
                ) {
                    Text(text = "Try again", color = PrimaryColor)
                }
            },
            text = {
                Text(text = "Email adress or password incorrect",color = PrimaryColor)
            },

        )
    }
}
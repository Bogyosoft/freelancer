package com.example.freelancer.ui.fields

import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.ButtonDefaults
import androidx.compose.material.Text
import androidx.compose.material.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController

@Composable
fun navButton(
    passwordErrorState: MutableState<Boolean>,
    password: MutableState<TextFieldValue>,
    email: MutableState<TextFieldValue>,
    emailErrorState: MutableState<Boolean>,
    text: String,
    navController: NavHostController
) {

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
                }
            }

        },
        content = {
            Text(text = text, color = Color.White)
        },
        modifier = Modifier.fillMaxWidth().height(50.dp),
        colors = ButtonDefaults.buttonColors(backgroundColor = Color.Red),
        shape = RoundedCornerShape(50.dp)
    )
    Spacer(Modifier.size(16.dp))

}
@Composable
fun elseButton(text: String, navController: NavHostController){

    Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.Center) {
        TextButton(onClick = {navController.navigate(text)},
            modifier = Modifier
                .fillMaxWidth()
                .border(width = 2.dp, color = Color.Red, shape = RoundedCornerShape(50.dp)).height(50.dp),
        ) {
            Text(text = text, color = Color.Red)

        }
    }

}
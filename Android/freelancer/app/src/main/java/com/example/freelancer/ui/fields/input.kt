package com.example.freelancer.ui.fields

import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun inputField(input: MutableState<TextFieldValue>, ErrorState: MutableState<Boolean>,text: String) {

    OutlinedTextField(
        value = input.value,
        onValueChange = {
            if (ErrorState.value) {
                ErrorState.value = false
            }
            input.value = it
        },
        isError = ErrorState.value,
        modifier = Modifier.fillMaxWidth().height(60.dp),
        label = {
            Text(text = text)
        },
        shape = RoundedCornerShape(50.dp),
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color.Red,
            focusedLabelColor = Color.Red
        )
    )
    if (ErrorState.value) {
        Text(text = "Required", color = Color.Red)
    }
    Spacer(Modifier.size(16.dp))
}

@Composable
fun passwordField(
    password: MutableState<TextFieldValue>,
    passwordVisibility: MutableState<Boolean>,
    passwordErrorState: MutableState<Boolean>
) {

    OutlinedTextField(
        value = password.value,
        onValueChange = {
            if (passwordErrorState.value) {
                passwordErrorState.value = false
            }
            password.value = it
        },
        isError = passwordErrorState.value,
        modifier = Modifier.fillMaxWidth().height(60.dp),
        label = {
            Text(text = "Password")
        },
        trailingIcon = {
            IconButton(onClick = {
                passwordVisibility.value = !passwordVisibility.value
            },
            ) {
                Icon(
                    if (passwordVisibility.value) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                    "Visibility",
                    tint = Color.Red
                )
            }
        },
        shape = RoundedCornerShape(50.dp),
        visualTransformation = if (passwordVisibility.value) PasswordVisualTransformation() else VisualTransformation.None,
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color.Red,
            focusedLabelColor = Color.Red
        )
    )
    if (passwordErrorState.value) {
        Text(text = "Required", color = Color.Red)
    }
    Spacer(Modifier.size(16.dp))
}

@Composable
fun title(title: String){
    Text(text = buildAnnotatedString {
        withStyle(style = SpanStyle(color = Color.Red)) {
            append(title)
        }

    }, fontSize = 30.sp)
    Spacer(Modifier.size(16.dp))

}


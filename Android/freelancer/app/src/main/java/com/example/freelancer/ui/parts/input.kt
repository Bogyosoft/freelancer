package com.example.freelancer.ui.parts

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
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.freelancer.ui.theme.PrimaryColor

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
            focusedBorderColor = PrimaryColor,
            focusedLabelColor = PrimaryColor
        )
    )
    if (ErrorState.value) {
        Text(text = "Required", color = PrimaryColor)
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
                    tint = PrimaryColor
                )
            }
        },
        shape = RoundedCornerShape(50.dp),
        visualTransformation = if (passwordVisibility.value) PasswordVisualTransformation() else VisualTransformation.None,
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = PrimaryColor,
            focusedLabelColor = PrimaryColor
        )
    )
    if (passwordErrorState.value) {
        Text(text = "Required", color =PrimaryColor)
    }
    Spacer(Modifier.size(16.dp))
}

@Composable
fun title(title: String){
    Text(text = buildAnnotatedString {
        withStyle(style = SpanStyle(color = PrimaryColor)) {
            append(title)
        }

    }, fontSize = 30.sp)
    Spacer(Modifier.size(16.dp))

}


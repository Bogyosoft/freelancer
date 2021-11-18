package com.example.freelancer.ui.screens

import android.util.Log
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.ButtonDefaults
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavHostController
import com.example.freelancer.ActiveUser
import com.example.freelancer.MainActivity
import com.example.freelancer.model.Source
import com.example.freelancer.model.itemsItem
import com.example.freelancer.model.jobItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import com.example.freelancer.ui.parts.inputField
import com.example.freelancer.ui.parts.title
import com.example.freelancer.ui.theme.PrimaryColor
import com.example.freelancer.ui.viewmodel.ItemViewModel
import com.example.freelancer.ui.viewmodel.SourceViewModel

@Composable
fun CreateJobScreen(navController: NavHostController) {
    val destination = remember { mutableStateOf(TextFieldValue()) }
    val destinationErrorState = remember { mutableStateOf(false) }

    val sourcelocation = remember { mutableStateOf(TextFieldValue()) }
    val sourcelocationErrorState = remember { mutableStateOf(false) }

    val properties = remember { mutableStateOf(TextFieldValue()) }
    val propertiesErrorState = remember { mutableStateOf(false) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center,
    ) {
        title(title = "Create Job")
        inputField(input = destination, ErrorState =destinationErrorState , text = "Destination" )
        inputField(input = sourcelocation, ErrorState =sourcelocationErrorState , text = "Source Location" )
        inputField(input = properties, ErrorState =propertiesErrorState , text = "Properties" )

        CreateJobButton(destinationErrorState,destination,sourcelocation,sourcelocationErrorState,properties,propertiesErrorState,"Create",navController)

    }

    /*
    val source = Source(id = 0,
        location = sourcelocation.value.text,
        ActiveUser.getActiveUser()
        )

    val sourceViewModel = SourceViewModel()
    sourceViewModel.createSource(source = source)

    val item = itemsItem(destination = destination.value.text,
        id=0,
        properties =properties.value.text,
        source = source,
        status = "New"
        )

    val job = jobItem(freelancer = ActiveUser.getActiveUser(),
        id = 0,
        item = item
        )
    */

}
@Composable
fun CreateJobButton(
    destinationErrorState: MutableState<Boolean>,
    destination: MutableState<TextFieldValue>,
    sourcelocation: MutableState<TextFieldValue>,
    sourcelocationErrorState: MutableState<Boolean>,
    properties: MutableState<TextFieldValue>,
    propertiesErrorState: MutableState<Boolean>,
    text: String,
    navController: NavHostController
) {

    Button(
        onClick = {
            when {
                destination.value.text.isEmpty() -> {
                    destinationErrorState.value = true
                }
                sourcelocation.value.text.isEmpty() -> {
                    sourcelocationErrorState.value = true
                }
                properties.value.text.isEmpty() -> {
                    propertiesErrorState.value = true
                }
                else -> {
                    destinationErrorState.value = false
                    propertiesErrorState.value = false
                    propertiesErrorState.value = false
/*
                    var source = Source(id = 9,
                        location = "jwjejje",
                        ActiveUser.getActiveUser()
                    )
                    */
                    val source = Source(id = 0,
                        location = sourcelocation.value.text,
                        ActiveUser.getActiveUser()
                    )


                    val sourceViewModel = SourceViewModel()
                    sourceViewModel.createSource(source = source,destination.value.text,properties.value.text)
                    navController.navigate("Main")




                }
            }
        },
        content = {
            Text(text = text, color = Color.White)
        },
        modifier = Modifier
            .fillMaxWidth()
            .height(50.dp),
        colors = ButtonDefaults.buttonColors(backgroundColor = PrimaryColor),
        shape = RoundedCornerShape(50.dp)
    )
    Spacer(Modifier.size(16.dp))

}

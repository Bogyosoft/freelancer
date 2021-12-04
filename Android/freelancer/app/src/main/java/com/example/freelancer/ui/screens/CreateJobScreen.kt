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
import androidx.core.app.ActivityCompat.startActivityForResult
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
import com.sucho.placepicker.Constants
import com.sucho.placepicker.Constants.GOOGLE_API_KEY
import com.sucho.placepicker.MapType
import com.sucho.placepicker.PlacePicker

@Composable
fun CreateJobScreen(navController: NavHostController,activity: MainActivity) {
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
        sourcelocation.value = TextFieldValue(MainActivity.location)
        title(title = "Create Job")
        inputField(input = destination, ErrorState =destinationErrorState , text = "Destination" )
        inputField(input = sourcelocation, ErrorState =sourcelocationErrorState , text = "Source Location" )
        inputField(input = properties, ErrorState =propertiesErrorState , text = "Properties" )

        CreateJobButton(destinationErrorState,destination,sourcelocation,sourcelocationErrorState,properties,propertiesErrorState,"Create",navController)
        Button(onClick = {
            val intent = PlacePicker.IntentBuilder()
                .setLatLong(40.748672, -73.985628)  // Initial Latitude and Longitude the Map will load into
                .showLatLong(true)  // Show Coordinates in the Activity
                .setMapZoom(12.0f)  // Map Zoom Level. Default: 14.0
                .setAddressRequired(true) // Set If return only Coordinates if cannot fetch Address for the coordinates. Default: True
                .hideMarkerShadow(true) // Hides the shadow under the map marker. Default: False
                //.setMarkerDrawable(R.drawable.marker) // Change the default Marker Image
                //.setMarkerImageImageColor(R.color.colorPrimary)
                //.setFabColor(R.color.fabColor)
                //.setPrimaryTextColor(R.color.primaryTextColor) // Change text color of Shortened Address
                //.setSecondaryTextColor(R.color.secondaryTextColor) // Change text color of full Address
                //.setBottomViewColor(R.color.bottomViewColor) // Change Address View Background Color (Default: White)
                //.setMapRawResourceStyle(R.raw.map_style)  //Set Map Style (https://mapstyle.withgoogle.com/)
                .setMapType(MapType.NORMAL)
                .setPlaceSearchBar(true, GOOGLE_API_KEY) //Activate GooglePlace Search Bar. Default is false/not activated. SearchBar is a chargeable feature by Google
                .onlyCoordinates(true)  //Get only Coordinates from Place Picker
                .hideLocationButton(true)   //Hide Location Button (Default: false)
                .disableMarkerAnimation(true)   //Disable Marker Animation (Default: false)
                .build(activity)

            startActivityForResult(activity,intent, Constants.PLACE_PICKER_REQUEST,null)
            
        }) {
            Text(text = "map")
        }
        

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
                    val source = Source(id = 5,
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

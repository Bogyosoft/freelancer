package com.example.freelancer.ui.parts



import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.example.freelancer.model.UserItem




/*@Composable
fun UserItem(user:User) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(15.dp)
            .clickable { },
        elevation = 10.dp
    ) {
        Column(
            modifier = Modifier.padding(15.dp)
        ) {
            Text(
                buildAnnotatedString {
                    append(user.username)
                }
            )
            Text(
                buildAnnotatedString {
                    append(user.score.toString())
                }
            )
        }
    }
}*/
@Composable
fun ListViewItem(
    navController: NavController,
    userItem: UserItem,
    onItemClicked: (item: UserItem) -> Unit
) {
    ListViewItem(userItem = userItem, modifier = Modifier
        .padding(8.dp)
        .clickable {
            onItemClicked(userItem)
            navController.navigate("userDetails")
        }
        .fillMaxWidth()
    )}


@Composable
fun ListViewItem(
    userItem: UserItem, modifier: Modifier
) {
    Card(modifier = modifier) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(text = userItem.username)
        }
    }
}
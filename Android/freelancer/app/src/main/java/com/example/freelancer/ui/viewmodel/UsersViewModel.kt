package com.vyns.mvvmjetpackcomposesample.ui.viewmodel

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.UserItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository

import kotlinx.coroutines.launch

class UsersViewModel : ViewModel() {
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository
    var userList: List<UserItem> by mutableStateOf(listOf())

    lateinit var clickedItem: UserItem

    init {
        fetchUsers()
    }

    fun fetchUsers() {

        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            var response = repository.getAllUsers()
            when (response) {
                is FreeLancerRepository.Result.Success -> {

                    Log.d("MainViewModel", "Success")
                    userList = response.userList
                }
                is FreeLancerRepository.Result.Failure -> {
                    Log.d("MainViewModel", "FAILURE")
                }
            }
        }
    }

    fun itemClicked(item: UserItem) {
        clickedItem = item
    }
}
package com.vyns.mvvmjetpackcomposesample.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.IItem
import com.example.freelancer.model.UserItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import com.example.freelancer.ui.viewmodel.IViewModel
import kotlinx.coroutines.launch

class UsersViewModel() : ViewModel(), IViewModel{
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository
    override var clickedItem: IItem
        get() = clickedItem
        set(value) {clickedItem=value}

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
                    list = response.list as List<UserItem>
                }
                is FreeLancerRepository.Result.Failure -> {
                    Log.d("MainViewModel", "FAILURE")
                }
            }
        }
    }

    override fun itemClicked(item: IItem) {
        clickedItem = item
    }

    override var list: List<IItem>
        get() = list
        set(value) {list = value}

}
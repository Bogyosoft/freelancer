package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.IItem
import com.example.freelancer.model.jobItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class JobViewModel : ViewModel(),IViewModel{
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository
    var jobList: List<jobItem> by mutableStateOf(listOf())



    lateinit var clickedItem: IItem

    init {
        fetchUsers()
    }

    fun fetchUsers() {
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            val response = repository.getAllUsers()
            when (response) {
                is FreeLancerRepository.Result.Success -> {

                    Log.d("JobViewModel", "Success")
                    jobList = response.list as List<jobItem>
                }
                is FreeLancerRepository.Result.Failure -> {
                    Log.d("JobViewModel", "FAILURE")
                }
            }
        }
    }

    override fun itemClicked(item: IItem) {
        clickedItem = item as jobItem
    }

    override var list: List<IItem>
        get() = list
        set(value) {}

}
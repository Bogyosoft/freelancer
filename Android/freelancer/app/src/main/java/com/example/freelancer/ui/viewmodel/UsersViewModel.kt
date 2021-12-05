package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.IItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class UsersViewModel() : ViewModel(), IViewModel{
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository
    override lateinit var clickedItem: IItem

    override val list: MutableLiveData<List<IItem>> by lazy {
        MutableLiveData<List<IItem>>().also {
            fetchUsers()
        }
    }

    init {
        fetchUsers()
    }

    fun fetchUsers() {
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            val response = repository.getAllUsers()
            when (response) {
                is FreeLancerRepository.Result.Success -> {

                    Log.d("MainViewModel", "Success")
                    list.value = response.list as List<IItem>
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

    override fun refresh() {
        fetchUsers()
    }




}
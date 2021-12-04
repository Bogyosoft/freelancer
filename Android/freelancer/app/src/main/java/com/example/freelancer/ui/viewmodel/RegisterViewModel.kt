package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.UserItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class RegisterViewModel: ViewModel() {

    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository

    fun registerUser(userItem: UserItem):Boolean{
        var res= true
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {

            res= repository.registerUser(userItem = userItem) {
                if (it?.id != null) {
                    Log.d("REGISTER","succes ")
                } else {
                    Log.d("REGISTER","failure ")
                }
            }
        }
        return res
    }
}
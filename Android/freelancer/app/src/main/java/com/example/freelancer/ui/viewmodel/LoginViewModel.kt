package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.UserDTO
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class LoginViewModel: ViewModel() {

    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository

    fun loginUser(userDTO: UserDTO):Boolean{
        var res= false
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {

            res= repository.login(userDTO) {
                if (it?.equals(null) ?: (true)) {
                    Log.d("login model","failure ")

                } else {
                    Log.d("login model","succes ")
                }
            }
        }
        return res
    }
}
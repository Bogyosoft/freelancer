package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.data.model.UserDTO
import com.example.freelancer.data.network.FreelancerApiClient
import com.example.freelancer.data.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class LoginViewModel: ViewModel() {

    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository



    fun loginUser(userDTO: UserDTO):Boolean{
        var res= true
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {

             repository.login(userDTO) {
                if (it?.equals(null) ?: (true)) {
                    Log.d("login model","failure ")
                    res = false

                } else {
                    Log.d("login model","succes ")
                    res = true
                }
            }
        }
        return res
    }

}
package com.example.freelancer.ui.viewmodel

import androidx.lifecycle.ViewModel
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository

class LoginViewModel: ViewModel() {

    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository

    /*

    fun loginUser(userDTO: UserDTO):Boolean{
        var res= false
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

    * */
}
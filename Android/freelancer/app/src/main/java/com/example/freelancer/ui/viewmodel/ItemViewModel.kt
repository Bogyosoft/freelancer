package com.example.freelancer.ui.viewmodel

import android.content.ClipData
import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.ActiveUser
import com.example.freelancer.model.Source
import com.example.freelancer.model.itemsItem
import com.example.freelancer.model.jobItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class ItemViewModel: ViewModel(){
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository

    fun createItem(item: itemsItem):itemsItem?{
        var result:itemsItem? = null

        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            result = repository.createItem(item = item) {
                if (it?.id != null) {
                    Log.d("item","succes ")

                    val job = jobItem(ActiveUser.getActiveUser(),0,it)
                    val jobViewModel = JobViewModel()
                    jobViewModel.createJobs(job)

                } else {
                    Log.d("item","failure ")
                }
            }
        }
        Log.d("item",result.toString())
        return result
    }
}
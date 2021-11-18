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
    override lateinit var clickedItem: IItem

    init {
        fetchJobs()
    }

    fun fetchJobs() {
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            val response = repository.getJobs()
            when (response) {
                is FreeLancerRepository.Result.Success -> {

                    Log.d("JobViewModel", "Success")
                    list = response.list as List<IItem>
                }
                is FreeLancerRepository.Result.Failure -> {
                    Log.d("JobViewModel", "FAILURE")
                }
            }
        }
    }
    fun createJobs(job : jobItem){
        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
        repository.createJob(job){
            if (it?.id != null) {
                Log.d("job","succes ")




            } else {
                Log.d("job","failure ")
            }
        }


        }


        }

    override fun itemClicked(item: IItem) {
        clickedItem = item as jobItem
    }

    override var list: List<IItem> = emptyList()

}
package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.Source
import com.example.freelancer.model.itemsItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class SourceViewModel: ViewModel(){
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository

     fun createSource(source: Source,destination: String, properties : String): Source? {
        var result:Source? = null

        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            result = repository.createSource(source = source) {
                if (it?.id != null) {
                    Log.d("source","success ")


                    val item = itemsItem(destination = destination,
                        id=0,
                        properties =properties,
                        source = it,
                        //status = "New"
                    )
                    val itemViewModel = ItemViewModel()
                    itemViewModel.createItem(item)





                } else {
                    Log.d("source","failure ")
                }
            }
        }
        return result
    }
}
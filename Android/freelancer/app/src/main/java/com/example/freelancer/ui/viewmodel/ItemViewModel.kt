package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.freelancer.model.IItem
import com.example.freelancer.model.itemsItem
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.repository.FreeLancerRepository
import kotlinx.coroutines.launch

class ItemViewModel: ViewModel(),IViewModel{
    private val apiService = FreelancerApiClient.service
    private lateinit var repository: FreeLancerRepository
    override val list: MutableLiveData<List<IItem>> by lazy {
        MutableLiveData<List<IItem>>().also {
            fetchItems()
        }
    }
    override lateinit var clickedItem: IItem


    init {
        fetchItems()
    }

    fun createItem(item: itemsItem):itemsItem?{
        var result:itemsItem? = null

        repository = FreeLancerRepository(apiService)
        viewModelScope.launch {
            result = repository.createItem(item = item) {
                if (it?.id != null) {
                    Log.d("item","succes ")

                } else {
                    Log.d("item","failure ")
                }
            }
        }
        Log.d("item",result.toString())
        return result
    }

    fun fetchItems(){
            repository = FreeLancerRepository(apiService)
            viewModelScope.launch {
                val response = repository.fetchItems()
                when (response) {
                    is FreeLancerRepository.Result.Success -> {
                        Log.d("itemsviewmodel", "Success")
                        list.value = response.list as List<IItem>
                    }
                    is FreeLancerRepository.Result.Failure -> {
                        Log.d("itemsviewmodel", "FAILURE")
                    }
                }
            }
    }

    override fun itemClicked(item: IItem) {
        clickedItem = item
    }

    override fun refresh() {
        fetchItems()
    }
}
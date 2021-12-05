package com.example.freelancer.ui.viewmodel

import android.util.Log
import androidx.lifecycle.*
import com.example.freelancer.data.model.IItem
import com.example.freelancer.data.repository.IRepository
import com.example.freelancer.utils.ServiceLocatior
import kotlinx.coroutines.launch

class UsersViewModel() : BaseViewModel() {

    private var repository = ServiceLocatior.getUserRepository()


    override fun itemClicked(item: IItem) {
        clickedItem = item
    }

    override suspend fun fetch() {
        viewModelScope.launch {
            val response = repository.getAllUsers()
            when (response) {
                is IRepository.Result.Success -> {

                    Log.d("MainViewModel", "Success")
                    list.value = response.list as List<IItem>
                }
                is IRepository.Result.Failure -> {
                    Log.d("MainViewModel", "FAILURE")
                }
            }
        }
    }
}
package com.example.freelancer.ui.viewmodel

import androidx.lifecycle.MutableLiveData
import com.example.freelancer.model.IItem

interface IViewModel {
    fun itemClicked(item: IItem):Unit
    fun refresh()

    val list : MutableLiveData<List<IItem>>
    var clickedItem: IItem

}
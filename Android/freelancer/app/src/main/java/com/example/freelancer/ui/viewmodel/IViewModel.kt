package com.example.freelancer.ui.viewmodel

import com.example.freelancer.model.IItem

interface IViewModel {
    fun itemClicked(item: IItem):Unit
    val list : List<IItem>
    var clickedItem: IItem

}
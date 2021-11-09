package com.example.freelancer.ui.viewmodel

import com.example.freelancer.model.IItem

interface IViewModel {
    fun itemClicked(item: IItem):Any
    var list : List<IItem>
    var clickedItem: IItem

}
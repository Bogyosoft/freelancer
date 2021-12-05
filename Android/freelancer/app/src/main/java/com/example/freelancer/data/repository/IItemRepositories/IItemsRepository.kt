package com.example.freelancer.data.repository.IItemRepositories

import com.example.freelancer.data.model.Item
import com.example.freelancer.data.model.Source
import com.example.freelancer.data.repository.IRepository

interface IItemsRepository: IRepository
{
    fun createItem(item: Item, onResult: (Item?) -> Unit): Item?
    suspend fun fetchItems(): IRepository.Result
    fun createSource(source: Source, onResult: (Source?) -> Unit): Source?
}
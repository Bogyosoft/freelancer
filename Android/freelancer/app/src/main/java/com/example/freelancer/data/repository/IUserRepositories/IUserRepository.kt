package com.example.freelancer.data.repository.IUserRepositories

import com.example.freelancer.data.model.UserDTO
import com.example.freelancer.data.model.UserItem
import com.example.freelancer.data.repository.IRepository

interface IUserRepository: IRepository {
    suspend fun getAllUsers(): IRepository.Result
    fun registerUser(userItem: UserItem, onResult: (UserItem?) -> Unit):Boolean
    fun login(userDTO: UserDTO, onResult: (UserDTO?) -> Unit): Boolean
}
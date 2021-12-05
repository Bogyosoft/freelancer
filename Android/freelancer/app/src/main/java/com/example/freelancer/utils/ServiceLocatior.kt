package com.example.freelancer.utils

import com.example.freelancer.data.network.FreelancerApiClient
import com.example.freelancer.data.repository.IItemRepositories.IItemsRepository
import com.example.freelancer.data.repository.IItemRepositories.ItemRepository
import com.example.freelancer.data.repository.IJobRepositories.IJobRepository
import com.example.freelancer.data.repository.IJobRepositories.JobRepository
import com.example.freelancer.data.repository.IUserRepositories.IUserRepository
import com.example.freelancer.data.repository.IUserRepositories.UserRepository

object ServiceLocatior {
    fun getUserRepository():IUserRepository = UserRepository(FreelancerApiClient.service)
    fun getJobRepository():IJobRepository = JobRepository(FreelancerApiClient.service)
    fun getItemRepository():IItemsRepository = ItemRepository(FreelancerApiClient.service)

}
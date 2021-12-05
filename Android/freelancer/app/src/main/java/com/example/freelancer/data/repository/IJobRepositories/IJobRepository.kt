package com.example.freelancer.data.repository.IJobRepositories

import com.example.freelancer.data.model.Item
import com.example.freelancer.data.model.JobItem
import com.example.freelancer.data.repository.IRepository

interface IJobRepository : IRepository {
    fun passJob(job: JobItem, onResult: (JobItem?) -> Unit)
    suspend fun getJobs(): IRepository.Result
    fun createJob(jobItem: Item, onResult: (JobItem?) -> Unit): Boolean
    fun delivereJob(job: JobItem,onResult: (JobItem?) -> Unit)
}
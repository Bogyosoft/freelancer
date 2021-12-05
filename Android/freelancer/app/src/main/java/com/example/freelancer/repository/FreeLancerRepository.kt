package com.example.freelancer.repository

import android.util.Log
import com.example.freelancer.ActiveUser
import com.example.freelancer.model.*
import com.example.freelancer.network.FreelancerAPIService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class FreeLancerRepository (private val freelancerAPi: FreelancerAPIService) {
    sealed class Result {
        object LOADING : Result()
        data class Success(val list : List<Any>) :Result()
        data class Failure(val throwable: Throwable): Result()
    }

    fun passJob(job: JobItem, onResult: (JobItem?) -> Unit){
        try {
            freelancerAPi.passJob(id = job.id, token = ActiveUser.token)
                .enqueue(
                object : Callback<JobItem>{
                    override fun onFailure(call: Call<JobItem>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse( call: Call<JobItem>, response: Response<JobItem>) {
                        val responseItem = response.body()
                        onResult(responseItem)
                        Log.d("Job Passing response",response.raw().toString())

                        Log.d("Job Passing response","Succes")
                    }
                }
            )
            Log.d("Job Passing response","Succes")

        }
        catch (exception:Exception){
            Log.d("Job Passing", "Failed $exception")

        }

    }

    suspend fun getAllUsers():Result{
        return try {
            val userList = freelancerAPi.getAllUsers(ActiveUser.token)
            Log.d("USERLISt","success "+userList.size)
            Result.Success(list = userList)
        }catch (exception:Exception){
            Log.d("USERLISt","failure "+exception.toString())

            Result.Failure(exception)
        }
    }

    suspend fun getJobs():Result{
        return try {
            val jobList = freelancerAPi.getJobs(ActiveUser.token)
            Log.d("Joblist","success "+jobList.size)
            Result.Success(list = jobList)
        }catch (exception:Exception){
            Log.d("Joblist","failure "+exception.toString())

            Result.Failure(exception)
        }

    }

    fun registerUser(userItem: UserItem, onResult: (UserItem?) -> Unit):Boolean{
        try {
            freelancerAPi.registerUser(userItem = userItem).enqueue(
                object : Callback<UserItem>{
                    override fun onFailure(call: Call<UserItem>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse( call: Call<UserItem>, response: Response<UserItem>) {
                        val addedUser = response.body()
                        onResult(addedUser)
                    }
                }
            )
        }
        catch (exception:Exception){
            Log.d("Registration","Failed " +exception.toString())

            return false
        }
        Log.d("Registration","Succesfull")

        return true
    }

    fun createSource(source: Source, onResult: (Source?) -> Unit): Source? {
        var result : Source? = null
        try {
            freelancerAPi.createSource(source = source,ActiveUser.token).enqueue(
                object : Callback<Source>{
                    override fun onFailure(call: Call<Source>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse( call: Call<Source>, response: Response<Source>) {
                        Log.d("Source response",response.raw().toString())
                        Log.d("Source token",ActiveUser.token)

                        val newSource = response.body()
                        onResult(newSource)
                        if (newSource != null) {
                            result =newSource
                        }
                    }
                }
            )
        }
        catch (exception:Exception){
            Log.d("Source creation", "Failed $exception")

            return null
        }
        Log.d("Source creation","Succesfull")

        return result
    }

    fun createItem(item: Item, onResult: (Item?) -> Unit): Item? {
        var result : Item? = null
        try {
            freelancerAPi.createItems(item = item,ActiveUser.token).enqueue(
                object : Callback<Item>{
                    override fun onFailure(call: Call<Item>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse(call: Call<Item>, response: Response<Item>) {
                        Log.d("item creation",response.raw().body.toString())

                        val newItem = response.body()
                        onResult(newItem)
                        if(newItem!=null){
                            result = newItem
                        }
                    }
                }
            )
        }
        catch (exception:Exception){
            Log.d("item creation","Failed " +exception.toString())

            return null
        }
        Log.d("item creation","Succesfull")

        return result
    }
    fun createJob(jobItem: Item, onResult: (JobItem?) -> Unit): Boolean {
        try {
            freelancerAPi.createJob(jobItem = jobItem,ActiveUser.token).enqueue(
                object : Callback<JobItem>{
                    override fun onFailure(call: Call<JobItem>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse(call: Call<JobItem>, response: Response<JobItem>) {
                        Log.d("job response",response.raw().toString())

                        val newjob = response.body()
                        onResult(newjob)
                    }
                }
            )
        }
        catch (exception:Exception){
            Log.d("item creation","Failed " +exception.toString())

            return false
        }
        Log.d("item creation","Succesfull")

        return true
    }
    fun login(userDTO: UserDTO, onResult: (UserDTO?) -> Unit): Boolean {
        try {
            freelancerAPi.login(userDTO = userDTO).enqueue(
                object : Callback<UserDTO>{
                    override fun onFailure(call: Call<UserDTO>, t: Throwable) {
                            onResult(null)
                        throw t
                    }
                    override fun onResponse(call: Call<UserDTO>, response: Response<UserDTO>) {
                        val user = response.body()
                        Log.d("login sent",userDTO.username)
                        response.headers().get("Set-Cookie")?.let { Log.d("login token", it) }
                        ActiveUser.token =response.headers().get("Set-Cookie").toString()
                        Log.d("login","Succesfull")
                            onResult(user)
                    }
                }
            )
        }
        catch (exception:Exception){
            Log.d("login","Failed " +exception.toString())

            return false
        }

        return true
    }

    suspend fun fetchItems():Result {
        return try {
            val itemsList = freelancerAPi.getItems(ActiveUser.token)
            Log.d("items","success "+itemsList.size)
            Result.Success(list = itemsList)
        }catch (exception:Exception){
            Log.d("items","failure "+exception.toString())

            Result.Failure(exception)
        }
    }
    fun delivereJob(job: JobItem,onResult: (JobItem?) -> Unit){

            try {
                freelancerAPi.deliverJob(job.id, token = ActiveUser.token)
                .enqueue(
                    object : Callback<JobItem>{
                        override fun onFailure(call: Call<JobItem>, t: Throwable) {
                            onResult(null)
                            throw t
                        }
                        override fun onResponse( call: Call<JobItem>, response: Response<JobItem>) {
                            val responseItem = response.body()
                            onResult(responseItem)
                            Log.d("Job delivery response",response.raw().toString())

                            Log.d("Job delivery response","Succes")
                        }
                    }



                )

                Log.d("Job delivery", "succes")

            }
            catch (exception:Exception){
                Log.d("Job delivery", "Failed $exception")

            }

    }

}

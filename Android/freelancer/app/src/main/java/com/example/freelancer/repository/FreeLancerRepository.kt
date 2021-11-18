package com.example.freelancer.repository

import android.util.Log
import com.example.freelancer.model.*
import com.example.freelancer.network.FreelancerAPIService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class FreeLancerRepository (val freelancerAPi: FreelancerAPIService) {
    sealed class Result {
        object LOADING : Result()
        data class Success(val list : List<Any>) :Result()
        data class Failure(val throwable: Throwable): Result()


    }
    suspend fun getAllUsers():Result{
        return try {
            val userList = freelancerAPi.getAllUsers()
            Log.d("USERLISt","success "+userList.size)
            Result.Success(list = userList)
        }catch (exception:Exception){
            Log.d("USERLISt","failure "+exception.toString())

            Result.Failure(exception)
        }
    }

    suspend fun getJobs():Result{
        return try {
            val jobList = freelancerAPi.getJobs()
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
            freelancerAPi.createSource(source = source).enqueue(
                object : Callback<Source>{
                    override fun onFailure(call: Call<Source>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse( call: Call<Source>, response: Response<Source>) {
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
            Log.d("Source creation","Failed " +exception.toString())

            return null
        }
        Log.d("Source creation","Succesfull")

        return result
    }

    fun createItem(item: itemsItem, onResult: (itemsItem?) -> Unit): itemsItem? {
        var result : itemsItem? = null
        try {
            freelancerAPi.createItems(item = item).enqueue(
                object : Callback<itemsItem>{
                    override fun onFailure(call: Call<itemsItem>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse( call: Call<itemsItem>, response: Response<itemsItem>) {
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
    fun createJob(jobItem: jobItem, onResult: (jobItem?) -> Unit): Boolean {
        try {
            freelancerAPi.createJob(jobItem = jobItem).enqueue(
                object : Callback<jobItem>{
                    override fun onFailure(call: Call<jobItem>, t: Throwable) {
                        onResult(null)
                        throw t
                    }
                    override fun onResponse( call: Call<jobItem>, response: Response<jobItem>) {
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
                        Log.d("login",response.raw().header("token","").toString() )
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
        Log.d("login","Succesfull")

        return true
    }
}

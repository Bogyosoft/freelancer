package com.example.freelancer.repository

import android.util.Log
import com.example.freelancer.model.UserItem
import com.example.freelancer.network.FreelancerAPIService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class FreeLancerRepository (val freelancerAPi: FreelancerAPIService) {
    sealed class Result {
        object LOADING : Result()
        data class Success(val userList : List<UserItem>) :Result()
        data class Failure(val throwable: Throwable): Result()


    }
    suspend fun getAllUsers():Result{
        return try {
            val userList = freelancerAPi.getAllUsers()
            Log.d("USERLISt","success "+userList.size)
            Result.Success(userList = userList)
        }catch (exception:Exception){
            Log.d("USERLISt","failure "+exception.toString())

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

}

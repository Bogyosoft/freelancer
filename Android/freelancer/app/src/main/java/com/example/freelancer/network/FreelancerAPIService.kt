package com.example.freelancer.network

import com.example.freelancer.model.UserItem
import com.example.freelancer.model.jobItem
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.POST

//private const val BASE_URL = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/"



/**
 * Use the Retrofit builder to build a retrofit object using a Moshi converter with our Moshi
 * object.
 * private val retrofit = Retrofit.Builder()
.addConverterFactory(MoshiConverterFactory.create(moshi))
.baseUrl(BASE_URL)
.build()
private val moshi = Moshi.Builder()
.add(KotlinJsonAdapterFactory())
.build()
 */


interface FreelancerAPIService {

    @GET("user")
    suspend fun getAllUsers(): List<UserItem>

    @Headers("Content-Type: application/json")
    @POST("user")
    fun registerUser(@Body userItem: UserItem) : Call<UserItem>

    @GET("jobs")
    fun getJobs() : List<jobItem>

}

//object FreelancerAPI{
//
//    val retrofitService: FreelancerAPIService by lazy { retrofit.create(FreelancerAPIService::class.java) }
//}


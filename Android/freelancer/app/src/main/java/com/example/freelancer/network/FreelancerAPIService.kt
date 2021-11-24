package com.example.freelancer.network

import com.example.freelancer.model.*
import retrofit2.Call
import retrofit2.http.*

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
    var token: String

    @GET("/api/v1/user")
    suspend fun getAllUsers(@Header("token") token: String): List<UserItem>

    @Headers("Content-Type: application/json")
    @POST("/api/v1/user")
    fun registerUser(@Body userItem: UserItem,@Header("token") token: String) : Call<UserItem>

    @GET("/api/v1/jobs")
    suspend fun getJobs(@Header("token") token: String) : List<jobItem>

    @GET("/api/v1/items")
    suspend fun getItems(@Header("token") token: String) : List<itemsItem>


    @Headers("Content-Type: application/json")
    @POST("/api/v1/jobs")
    fun createJob(@Body jobItem: jobItem,@Header("token") token: String) : Call<jobItem>

    @Headers("Content-Type: application/json")
    @POST("/api/v1/sources")
    fun createSource(@Body source: Source,@Header("Set-Cookie") token: String) : Call<Source>

    @Headers("Content-Type: application/json")
    @POST("/api/v1/items")
    fun createItems(@Body item: itemsItem,@Header("token") token: String) : Call<itemsItem>


    @Headers("Content-Type: application/json")
    @POST("/api/auth")
    fun login(@Body userDTO: UserDTO) : Call<UserDTO>
}

//object FreelancerAPI{
//
//    val retrofitService: FreelancerAPIService by lazy { retrofit.create(FreelancerAPIService::class.java) }
//}


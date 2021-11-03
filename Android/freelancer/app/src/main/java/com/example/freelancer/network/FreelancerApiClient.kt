package com.example.freelancer.network

import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

object FreelancerApiClient {

    const val BASE_URL = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/"

    private val retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .addConverterFactory(MoshiConverterFactory.create())
    val  service:FreelancerAPIService by lazy {
        retrofit.build().
        create(FreelancerAPIService::class.java)
    }

}
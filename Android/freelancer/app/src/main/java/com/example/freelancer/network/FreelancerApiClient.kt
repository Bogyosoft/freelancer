package com.example.freelancer.network

import android.app.Application
import com.example.freelancer.network.interceptor.ReceivedCookiesInterceptor
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

object FreelancerApiClient {
//v1 vissza
    const val BASE_URL = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com"

    private lateinit var application: Application
    private  lateinit var retrofit :Retrofit.Builder
    lateinit var  service:FreelancerAPIService

    fun setContext(a:Application){
        application = a

    }

    fun initRetrofit(){
        retrofit =  Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(MoshiConverterFactory.create())
                /*
                * .client(
                OkHttpClient.Builder()
                    .addInterceptor(ReceivedCookiesInterceptor(application.applicationContext))
                    .build())
                *
                * */

    }
    fun initService(){
        service = retrofit.build().
            create(FreelancerAPIService::class.java)
    }


}







package com.example.freelancer

import android.app.Application
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import android.widget.FrameLayout
import com.example.freelancer.network.FreelancerApiClient
import egolabsapps.basicodemine.videolayout.VideoLayout
import kotlin.concurrent.thread

class StartActivity : AppCompatActivity() {
    lateinit var frameLayout: FrameLayout
    lateinit var videoLayout: VideoLayout


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        requestWindowFeature(Window.FEATURE_NO_TITLE)

        setContentView(R.layout.activity_start)
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

        FreelancerApiClient.setContext(this.applicationContext as Application)
        FreelancerApiClient.initRetrofit()
        FreelancerApiClient.initService()
        //findViewById<VideoLayout>(R.id.videoLayout).mediaPlayer.start()


    }


    override fun onStop() {
        super.onStop()
        findViewById<VideoLayout>(R.id.videoLayout).mediaPlayer.stop()

    }
}
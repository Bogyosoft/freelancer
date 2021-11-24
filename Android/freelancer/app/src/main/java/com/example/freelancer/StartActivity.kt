package com.example.freelancer

import android.app.Application
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.example.freelancer.network.FreelancerApiClient
import com.example.freelancer.ui.screens.colors
import egolabsapps.basicodemine.videolayout.VideoLayout

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

        colors.initColors()
    }


    override fun onStop() {
        super.onStop()
        findViewById<VideoLayout>(R.id.videoLayout).mediaPlayer.stop()

    }
}
package com.example.freelancer

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import android.widget.FrameLayout
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


        //initViews()



    }


    fun initViews() {
        frameLayout = findViewById(R.id.frameLayout)
        videoLayout = VideoLayout(this)
        videoLayout.setGravity(VideoLayout.VGravity.centerCrop)
        videoLayout.setIsLoop(true)
        videoLayout.setPathOrUrl("loginvideotype3.mp4")
        frameLayout.addView(videoLayout)
    }



}
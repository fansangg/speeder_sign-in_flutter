package com.fansan.speeder.speeder_sign_flutter

import android.content.Intent
import android.content.pm.ShortcutInfo
import android.content.pm.ShortcutManager
import android.graphics.drawable.Icon
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {


    @RequiresApi(Build.VERSION_CODES.N_MR1)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("fansangg", "intent.action == ${intent.action}")
        if (intent.action == "signin") {
            callFlutter()
        }
        createShortcuts()
    }

    @RequiresApi(Build.VERSION_CODES.N_MR1)
    private fun createShortcuts(){
        val shortcutManager = getSystemService(ShortcutManager::class.java) as ShortcutManager
        Log.d("fansangg", "shortcutManager.dynamicShortcuts.isEmpty() == ${shortcutManager.dynamicShortcuts.isEmpty()}")
        if (shortcutManager.dynamicShortcuts.isEmpty()){
            val intent = Intent(this,MainActivity::class.java)
            intent.action = "signin"
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK or Intent.FLAG_ACTIVITY_NEW_TASK)
            val info = ShortcutInfo.Builder(this,"signin")
                .setShortLabel("签到")
                .setIcon(Icon.createWithResource(this,R.mipmap.ic_launcher))
                .setIntent(intent)
                .build()
            shortcutManager.dynamicShortcuts = listOf(info)
        }
    }

    private fun callFlutter(){
        flutterEngine?.let {
            val toFlutter = MethodChannel(it.dartExecutor.binaryMessenger, "toFlutter")
            toFlutter.invokeMethod("signin","",object:MethodChannel.Result{
                override fun success(result: Any?) {
                    Log.d("fansangg", "调用成功")
                }

                override fun error(
                    errorCode: String, errorMessage: String?, errorDetails: Any?
                ) {
                    Log.d("fansangg", "调用失败")
                }

                override fun notImplemented() {
                    Log.d("fansangg", "notImplemented")
                }

            })
        }
    }
}

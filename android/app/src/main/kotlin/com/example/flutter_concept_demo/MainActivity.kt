package com.example.flutter_concept_demo

import android.content.Intent
import android.content.pm.ResolveInfo
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.*

class MainActivity : FlutterActivity() {
    private val channel = "flutter_demo"
    private val TAG = "Native"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.d(TAG, "configureFlutterEngine: called")
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getInstalledApps" -> getInstalledApps(result)
            }
        }
    }

    private fun getInstalledApps(result: MethodChannel.Result) {
        Log.d(TAG, "getInstalledApps: called")
        val intent = Intent(Intent.ACTION_MAIN, null)
        intent.addCategory(Intent.CATEGORY_LAUNCHER)
        val list: List<ResolveInfo> = context.packageManager.queryIntentActivities(intent, 0)
        val installedApps: MutableList<Map<String, Any>> = LinkedList()
        for (item in list) {
            val app = mutableMapOf<String, Any>()
            app["packageName"] = item.activityInfo.packageName
            app["icon"] = convertIcon(item.loadIcon(context.packageManager))
            app["appName"] = item.loadLabel(context.packageManager)
            installedApps.add(app)
        }
        Log.d(TAG, "getInstalledApps size: ${installedApps.size}")
        result.success(installedApps)
    }

    private fun convertIcon(icon: Drawable): ByteArray {
        val bitmap = Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        icon.setBounds(0, 0, 64, 64)
        icon.draw(canvas)
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 70, stream)
        stream.close()
        return stream.toByteArray()
    }
}

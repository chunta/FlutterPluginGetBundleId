package com.example.verbuildno

object NativeLib {
    init {
        System.loadLibrary("native-lib")
    }

    external fun stringFromJNI(): String
    external fun numberOfCoreFromJNI(): String
}
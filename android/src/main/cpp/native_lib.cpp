// android/src/main/cpp/native_lib.cpp
#include <jni.h>
#include <thread>

extern "C"
JNIEXPORT jstring JNICALL
Java_com_example_verbuildno_NativeLib_stringFromJNI(JNIEnv* env, jobject /* this */) {
    return env->NewStringUTF("Hello from C++");
}


extern "C"
JNIEXPORT jstring JNICALL
Java_com_example_verbuildno_NativeLib_numberOfCoreFromJNI(JNIEnv* env, jobject /* this */) {
    int number = std::thread::hardware_concurrency();
    std::string numberStr = std::to_string(number);
    return env->NewStringUTF(numberStr.c_str());
}
#include "NativeLib.h"
#include <thread>

int NativeLib::numberOfCore() {
    return std::thread::hardware_concurrency();
}
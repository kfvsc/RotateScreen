#ifndef MAIN_H
#define MAIN_H

#include <QtGlobal>

#if TARGET_OS_IOS
#define main appEntryPoint
void setUIView(long winId);
#endif

int main(int argc, char* argv[]);

#endif // MAIN_H

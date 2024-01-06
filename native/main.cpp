#include "main.h"
#include "FPSMeter/fpsmeter.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>

int main(int argc, char* argv[]) {
    QGuiApplication app(argc, argv);
    qmlRegisterType<FPSMeter>("DebugTools", 1, 0, "FPSMeter");
    QQmlApplicationEngine engine;

    #if TARGET_OS_IOS
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [=](QObject *obj, const QUrl &objUrl) {
            if (obj->isWindowType()) {
                setUIView(qobject_cast<QWindow*>(obj)->winId());
            }
        }, Qt::QueuedConnection);
    #endif

    engine.load("qrc:/index.qml");
    return app.exec();
}

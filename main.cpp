#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>
#include <QDebug>

#include "src/app.h"
//#include <QApplication>
//#include <QCoreApplication>

int main(int argc, char *argv[])
{
    qInfo() << "this is a debug line";
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    App myApp;
    QQmlApplicationEngine engine;
    myApp.setEngine(&engine);

    engine.rootContext()->setContextProperty("app", &myApp);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
//    engine.load(QUrl(qgetenv("MAIN_QML")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}

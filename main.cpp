#include <QGuiApplication>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QUrl>
//#include <QApplication>
//#include <QCoreApplication>

int main(int argc, char *argv[])
{
    qInfo() << "this is a debug line";
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}

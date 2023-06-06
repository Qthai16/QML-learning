#include "app.h"

App::App(QObject *parent): QObject (parent)
{

}

App::~App() {

}

void App::loadQml()
{
    m_engine->clearComponentCache();
    //    m_engine->load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    auto mainQmlPath= QString(qgetenv("QML_PATH"));
    if (mainQmlPath.isEmpty()) {
        qCritical() << "QML_PATH environment variable is not set";
        return;
    }
    m_engine->load(mainQmlPath+"/main.qml");
}

QString App::qmlPath() {
    QString qmlPath(qgetenv("QML_PATH"));
    if (qmlPath.isEmpty()) {
        qCritical() << "QML_PATH environment variable is not set";
    }
    return qmlPath;
}

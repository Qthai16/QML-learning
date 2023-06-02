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
    m_engine->load(QUrl(qgetenv("QML_PATH")+"/main.qml"));
}

QString App::qmlPath() {
    return qgetenv("QML_PATH");
}

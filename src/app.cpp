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
    m_engine->load(QUrl(qgetenv("MAIN_QML")));
}

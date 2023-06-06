#ifndef APP_H
#define APP_H
#include <QObject>
#include <QtDebug>
#include <QQmlApplicationEngine>

class App : public QObject
{
    Q_OBJECT
public:
    App(QObject* parent = Q_NULLPTR);
    ~App();

    Q_INVOKABLE void loadQml();
    Q_INVOKABLE QString qmlPath();
    void setEngine(QQmlApplicationEngine *engine) { m_engine = engine; }

private:
    QQmlApplicationEngine* m_engine;
};

#endif // APP_H

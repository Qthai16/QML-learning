#ifndef APP_H
#define APP_H
#include <QObject>
#include <QQmlApplicationEngine>

class App : public QObject
{
    Q_OBJECT
public:
    App(QObject* parent = Q_NULLPTR);
    ~App();

    Q_INVOKABLE void loadQml();
    void setEngine(QQmlApplicationEngine *engine) { m_engine = engine; }

private:
    QQmlApplicationEngine* m_engine;
};

#endif // APP_H

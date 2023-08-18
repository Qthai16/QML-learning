#ifndef TRAYICON_H
#define TRAYICON_H

#include <QObject>
#include <QWidget>
#include <QSystemTrayIcon>

class TrayIcon : public QSystemTrayIcon
{
    Q_OBJECT
public:
    explicit TrayIcon(QObject *parent = nullptr);

signals:

};

#endif // TRAYICON_H

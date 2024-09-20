#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
#include <QMap>
#include "ISettingsControl.h"

class Settings : public QObject, public ISettingsControl
{
    Q_OBJECT
    //Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    Settings(QObject *parent = nullptr);
    ~Settings();

    // Interface slots
public slots:

    void write(QString key, QString value);

    QString read(QString key);


private:

    QSettings* settings;
    QMap<QString, QString> *map;
    QList<QString> keys;

};

#endif // SETTINGS_H

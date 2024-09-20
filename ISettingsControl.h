#ifndef ISETTINGSCONTROL_H
#define ISETTINGSCONTROL_H

#include <QObject>

class ISettingsControl
{
public slots:
    virtual void write(QString key, QString value) = 0;

    virtual QString read(QString key) = 0;
};

#endif // ISETTINGSCONTROL_H

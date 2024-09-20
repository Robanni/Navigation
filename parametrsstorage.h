#ifndef PARAMETRSSTORAGE_H
#define PARAMETRSSTORAGE_H

#include <QObject>
#include <QMap>
#include "ISettingsControl.h"

class ParametrsStorage: public QObject, public ISettingsControl
{
    Q_OBJECT

public:
    ParametrsStorage(QObject *parent = nullptr);
    ~ParametrsStorage();

public slots:

    void write(QString key, QString value);

    QString read(QString key);

private:
    QMap<QString, QString> *stringStorage;

};

#endif // PARAMETRSSTORAGE_H

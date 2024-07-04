#ifndef TRANSPORTCONTROLLER_H
#define TRANSPORTCONTROLLER_H

#include <QObject>

class TransportController : public QObject
{
    Q_OBJECT
public:
    explicit TransportController(QObject *parent = nullptr);

signals:

};

#endif // TRANSPORTCONTROLLER_H

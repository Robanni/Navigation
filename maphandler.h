#ifndef MAPHANDLER_H
#define MAPHANDLER_H

#include "navigationcontroller.h"
#include "transportcontroller.h"

#include <QObject>


class MapHandler : public QObject
{
    Q_OBJECT
public:
    explicit MapHandler(NavigationController* n,TransportController* t,QObject *parent = nullptr);

private:
    NavigationController* _navigationController;
    TransportController* _transportController;
public:
    Q_INVOKABLE QPointF getPosition();
    Q_INVOKABLE float getRotation();

    Q_INVOKABLE QPointF getLastIntersection();

};

#endif // MAPHANDLER_H

#ifndef MAPHANDLER_H
#define MAPHANDLER_H

#include "navigationcontroller.h"
#include "transportcontroller.h"

#include <QObject>
#include <QVariant>


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

    Q_INVOKABLE QPointF getLastLeftPos();
    Q_INVOKABLE QPointF getLastRightPos();
    Q_INVOKABLE QVariantList getLastSectionPositions();
    Q_INVOKABLE QVariantList getSections();
public slots:
    void onTransportDataReceived(TransportData data);
signals:
    void transportDataReceived(double CrossbarLenght,double NumberOfSections);
};

#endif // MAPHANDLER_H

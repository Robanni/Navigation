#ifndef NAVIGATIONCONTROLLER_H
#define NAVIGATIONCONTROLLER_H

#include "Support/Interfaces.h"

#include <QObject>
#include <QPointF>
#include <QVector2D>
#include <QDebug>

class NavigationController : public QObject, public IGetNavigationData
{
    Q_OBJECT
public:
    explicit NavigationController(QObject *parent = nullptr);

private:
    double _latitude = 1;
    double _longitude = 1;

    double _originLatitude = 51.6700;
    double _originLongitude = 39.2000;

    double _rotation = 0;

    double _crossbarLenght = 20;
    QVector<QPointF> _points;
    QVector<QPointF> _trajectoryPoints;
    QVector<QPointF> _crossPoints;
    QVector<QPointF> _sectionPoints;

    QPair<QPointF,QPointF> _leftRightBarPos;
    int i = 0;
private:
    void CalculateIntersection();
    QPointF CalculateEndPoint(bool left);
    QPointF CalculateSectionPoint(bool left,double lenght);
public:
    QPointF GetPosition();
    QPointF GetLastIntersection();
    QPair<QPointF,QPointF> GetLastCrossbarPos();
    QList<QPointF> GetLastSectionPoints();

    float GetRotation();

    // IGetNavigationData interface
public:
    void SetCoordinates(double lat, double lng,double rotation) override;
};

#endif // NAVIGATIONCONTROLLER_H

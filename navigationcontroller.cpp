#include "navigationcontroller.h"
#include "Support/SupportFunctions.h"

NavigationController::NavigationController(QObject *parent)
    : QObject{parent}
{


}

QPointF NavigationController::GetPosition()
{
    return _points.last();
}

QPointF NavigationController::GetLastIntersection()
{
    //(_crossPoints.isEmpty()) ? qDebug()<<"nan" : qDebug()<<sf::CoordsToGeo( _crossPoints.last().x(),_crossPoints.last().y(),_originLatitude,_originLongitude);
    return (_crossPoints.isEmpty()) ? QPointF(0, 0) : sf::CoordsToGeo( _crossPoints.last().x(),_crossPoints.last().y(),_originLatitude,_originLongitude);
}

float NavigationController::GetRotation()
{
    return _rotation;
}

void NavigationController::CalculateIntersection()
{
    if(_trajectoryPoints.size() < 7)return;

    QVector2D vecOne;
    QPointF A11 = _trajectoryPoints.last();
    QPointF A12 = _trajectoryPoints[_trajectoryPoints.count()-2];

    A12 = sf::GetUnitVecPointTwo(A11,sf::GetNormalPointTwo(A11,A12,true));
    A12 = A12- A11;

    A12*=_crossbarLenght;
    A12+=A11;//final second point

    for (int var = 1; var < _trajectoryPoints.count()-4; ++var)
    {

        QPointF f =sf::SegmentsCrossingPos(A11,A12,_trajectoryPoints[var-1],_trajectoryPoints[var]);
        if(f!=QPointF(0,0) )
        {
            _crossPoints.append(f);
            //qDebug()<<"Distance to crossing point:"<<sf::GetDistanceBetweenPoints(A11,f);
            //qDebug()<<"Result:"<<sf::GetDistanceBetweenPoints(A11,A12/2)/sf::GetDistanceBetweenPoints(A11,f);
        }
    }

    A12 = _trajectoryPoints[_trajectoryPoints.count()-2];

    A12 = sf::GetUnitVecPointTwo(A11,sf::GetNormalPointTwo(A11,A12,false));
    A12 = A12- A11;

    A12*=_crossbarLenght;
    A12+=A11;//final second point

    for (int var = 1; var < _trajectoryPoints.count()-4; ++var)
    {

        QPointF f =sf::SegmentsCrossingPos(A11,A12,_trajectoryPoints[var-1],_trajectoryPoints[var]);
        if(f!=QPointF(0,0))
        {
            _crossPoints.append(f);
            //qDebug()<<"Distance to crossing point:"<<sf::GetDistanceBetweenPoints(A11,f);
            //qDebug()<<"Result:"<<sf::GetDistanceBetweenPoints(A11,A12/2)/sf::GetDistanceBetweenPoints(A11,f);
        }
    }
}


void NavigationController::SetCoordinates(double lat, double lng,double rotation)
{
    _rotation = rotation;
    _points.append(QPointF(lat,lng));

    if(_points.count() == 1) {_originLatitude=_points.first().x(); _originLongitude = _points.first().y();}

    _trajectoryPoints.append(sf::GeoToCoords(_points.last().x(),_points.last().y(),_originLatitude,_originLongitude));

    CalculateIntersection();
}

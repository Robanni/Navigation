#include "navigationcontroller.h"
#include "Support/SupportFunctions.h"

NavigationController::NavigationController(QObject *parent)
    : QObject{parent}
{
}

NavigationController::NavigationController(TransportController *tc, QObject *parent)
{
    _transportController = tc;
}

QPointF NavigationController::GetPosition()
{
    return _points.last();
}

QPointF NavigationController::GetLastIntersection()
{
    return (_crossPoints.isEmpty()) ?
               QPointF(0, 0) : sf::CoordsToGeo( _crossPoints.last().x(),_crossPoints.last().y(),_originLatitude,_originLongitude);
}

QPair<QPointF, QPointF> NavigationController::GetLastCrossbarPos()
{
    return _leftRightBarPos;
}

QVector<QPointF> NavigationController::GetLastSectionPoints()
{
    QVector<QPointF> result =  QVector<QPointF>();
    if(_sectionPoints.count()>=10){
        result = _sectionPoints.last(10);
        _sectionPoints.clear();
    }
    return result;
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

    for (int i = 0; i <= 1; ++i) {

        bool side = (i == 0) ? true : false;

        QPointF A12 = _trajectoryPoints[_trajectoryPoints.count()-2];

        A12 = sf::GetUnitVecPointTwo(A11,sf::GetNormalPointTwo(A11,A12,side));
        A12 = A12- A11;

        A12*=_crossbarLenght;
        A12+=A11;//final second point

        for (int var = 1; var < _trajectoryPoints.count()-4; ++var)
        {

            QPointF f =sf::SegmentsCrossingPos(A11,A12,_trajectoryPoints[var-1],_trajectoryPoints[var]);
            if(f!=QPointF(0,0) )
            {
                _crossPoints.append(f);
                auto dist = sf::GetDistanceBetweenPoints(A11,f);
                auto percentage = dist/_crossbarLenght;
                _transportController->SendPercentageOfApproach(side,percentage);
            }
        }


    }
}

QPointF NavigationController::CalculateEndPoint(bool left)
{
    QPointF A11 = _trajectoryPoints.last();
    QPointF A12 = _trajectoryPoints[_trajectoryPoints.count()-2];

    A12 = sf::GetUnitVecPointTwo(A11,sf::GetNormalPointTwo(A11,A12,left));
    A12 = A12- A11;

    A12*=_crossbarLenght;
    A12+=A11;


    return A12;
}

QPointF NavigationController::CalculateSectionPoint(bool left, double lenght)
{
    QPointF A11 = _trajectoryPoints.last();
    QPointF A12 = _trajectoryPoints[_trajectoryPoints.count()-2];

    A12 = sf::GetUnitVecPointTwo(A11,sf::GetNormalPointTwo(A11,A12,left));
    A12 = A12 - A11;

    A12*=lenght;
    A12+=A11;


    return A12;
}



void NavigationController::SetCoordinates(double lat, double lng,double rotation)
{
    _rotation = rotation;
    _points.append(QPointF(lat,lng));

    if(_points.count() == 1) {_originLatitude=_points.first().x(); _originLongitude = _points.first().y();}

    _trajectoryPoints.append(sf::GeoToCoords(_points.last().x(),_points.last().y(),_originLatitude,_originLongitude));

    CalculateIntersection();

    if(_trajectoryPoints.count()<5)return;
    if(_trajectoryPoints.last()==_trajectoryPoints[_trajectoryPoints.count()-2]) return;


    auto leftBarPos = CalculateEndPoint(true);
    _leftRightBarPos.first = sf::CoordsToGeo( leftBarPos.x(),leftBarPos.y(),_originLatitude,_originLongitude);

    auto rightBarPos = CalculateEndPoint(false);
    _leftRightBarPos.second = sf::CoordsToGeo( rightBarPos.x(),rightBarPos.y(),_originLatitude,_originLongitude);

    for (int var = 0; var < _sectionsCount/2; ++var) {
        auto i = CalculateSectionPoint(true, _crossbarLenght - _crossbarLenght/_sectionsCount*2 * var);
        _sectionPoints.append(sf::CoordsToGeo( i.x(),i.y(),_originLatitude,_originLongitude));
    }

    for (int var = 0; var < _sectionsCount/2; ++var) {
        auto i = CalculateSectionPoint(false, _crossbarLenght - _crossbarLenght/_sectionsCount*2 * var);
        _sectionPoints.append(sf::CoordsToGeo( i.x(),i.y(),_originLatitude,_originLongitude));
    }

}

void NavigationController::onTransportDataReceived(TransportData data)
{
    _crossbarLenght = data.CrossbarLenght;
    _sectionsCount = data.NumberOfSections;
}

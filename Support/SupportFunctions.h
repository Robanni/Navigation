#ifndef SUPPORTFUNCTIONS_H
#define SUPPORTFUNCTIONS_H

#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>
#include <QPoint>
#include <QPointF>
#include <QVector2D>

namespace sf
{

const double R = 6378137.0;

std::vector<std::string> split(const std::string& s, char delimiter)
{
    std::vector<std::string> tokens;
    std::string token;
    std::istringstream tokenStream(s);
    while (std::getline(tokenStream, token, delimiter)) {
        tokens.push_back(token);
    }
    return tokens;
}

double convertToDecimal(const std::string& coordinate, const std::string& direction) {
    size_t dotPosition = coordinate.find('.');

    double degrees = std::stod(coordinate.substr(0, dotPosition - 2));
    double minutes = std::stod(coordinate.substr(dotPosition - 2)) / 60.0;

    double decimalCoordinate = degrees + minutes;

    if (direction == "S" || direction == "W") {
        decimalCoordinate *= -1;
    }

    return decimalCoordinate;
}

float GetDistanceBetweenPoints(QPoint pointOne,QPoint pointTwo)
{
    float a,b;
    a = pointTwo.x() - pointOne.x();
    b = pointTwo.y() - pointOne.y();

    return std::sqrt(std::pow(a,2) + std::pow(b,2));
}
float GetDistanceBetweenPoints(QPointF pointOne,QPointF pointTwo)
{
    float a,b;
    a = pointTwo.x() - pointOne.x();
    b = pointTwo.y() - pointOne.y();

    return std::sqrt(std::pow(a,2) + std::pow(b,2));
}

QPointF GetNormalPointTwo(QPointF p1,QPointF p2,bool LeftRight)
{
    int i;
    if(LeftRight) i=1;  else i=-1;

    float x = p1.x()+(p2.y()-p1.y())*i;
    float y = p1.y()+(p1.x()-p2.x())*i;

    return QPointF(x,y);
}
QPointF GetUnitVecPointTwo(QPointF p1, QPointF p2)
{
    float x = p2.x() - p1.x();
    float y = p2.y() - p1.y();

    float mod = sqrt(pow(x,2)+pow(y,2));

    x /= mod;
    y /= mod;

    return QPointF(x+p1.x(),y+p1.y());
}

bool RangeIntersection(float r1,float r2,float r3,float r4)
{
    if(r1>r2) std::swap(r1,r2);
    if(r3>r4) std::swap(r3,r4);

    return std::max(r1,r3)<= std::min(r2,r4);
}

QPointF SegmentsCrossingPos(QPointF p1,QPointF p2,QPointF p3, QPointF p4)
{

    if(RangeIntersection(p1.x(),p2.x(),p3.x(),p4.x())&&RangeIntersection(p1.y(),p2.y(),p3.y(),p4.y()))
    {

        QVector2D v(p2-p1);
        QVector2D v1(p3-p1);
        QVector2D v2(p4-p1);

        float Z1 = v1.x()*v.y() - v.x()*v1.y();
        float Z2 = v2.x()*v.y() - v.x()*v2.y();

        if(Z1*Z2>0)return QPointF(0,0);

        float px = p3.x()+(p4.x()-p3.x())*(abs(Z1)/abs(Z2-Z1));
        float py = p3.y()+(p4.y()-p3.y())*(abs(Z1)/abs(Z2-Z1));

        return QPointF(px,py);
    }

    return QPointF(0,0);
}

double DegToRad(double degrees) {
    return degrees * M_PI / 180.0;
}
double RadToDeg(double radians) {
    return radians * 180.0 / M_PI;
}

QPointF GeoToCoords(double lat, double lon, double lat0rigin, double lon0rigin) {

    lat = DegToRad(lat);
    lon = DegToRad(lon);
    lat0rigin = DegToRad(lat0rigin);
    lon0rigin = DegToRad(lon0rigin);


    double dLon = lon - lon0rigin;
    double dLat = lat - lat0rigin;


    double x = R * dLon * cos((lat + lat0rigin) / 2.0);
    double y = R * dLat;

    return QPointF(x, y) ;
}

QPointF CoordsToGeo(double x, double y, double lat0, double lon0) {

    lat0 = lat0 * M_PI / 180.0;
    lon0 = lon0 * M_PI / 180.0;


    double dLat = y / R;
    double dLon = x / (R * cos((lat0 + (lat0 + dLat)) / 2.0));


    double lat = lat0 + dLat;
    double lon = lon0 + dLon;


    lat = RadToDeg(lat);
    lon = RadToDeg(lon);

    return QPointF(lat, lon);
}

}
#endif // SUPPORTFUNCTIONS_H

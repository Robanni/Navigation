#ifndef SUPPORTFUNCTIONS_H
#define SUPPORTFUNCTIONS_H

#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>
#include <QPoint>
#include <QPointF>

namespace sf
{

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

}
#endif // SUPPORTFUNCTIONS_H

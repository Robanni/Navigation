#include "maphandler.h"

MapHandler::MapHandler(NavigationController* n, TransportController* t, QObject *parent)
    : QObject{parent}
{
    _navigationController = n;
    _transportController = t;
}

QPointF MapHandler::getPosition()
{
    return _navigationController->GetPosition();
}

float MapHandler::getRotation()
{
    return _navigationController->GetRotation();
}

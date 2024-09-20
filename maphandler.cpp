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

QPointF MapHandler::getLastIntersection()
{
    return _navigationController->GetLastIntersection();
}

QPointF MapHandler::getLastLeftPos()
{
    return _navigationController->GetLastCrossbarPos().first;
}

QPointF MapHandler::getLastRightPos()
{
    return _navigationController->GetLastCrossbarPos().second;
}

QVariantList MapHandler::getLastSectionPositions()
{
    QList<QPointF> pos = _navigationController->GetLastSectionPoints();

    QVariantList variantList;


    for (const QPointF &point : pos) {
        variantList << QVariant::fromValue(point);
    }

    return variantList;
}

QVariantList MapHandler::getSections()
{
    auto sectionsArray = _transportController->GetSections();
    QVariantList vList;

    for(auto section : sectionsArray)
    {
        vList << QVariant::fromValue(section);
    }
    //qDebug()<<vList.first().value<Section>().GetSectionPosition();
   // qDebug()<<vList.first().value<Section>().GetValue();
    return vList;
}

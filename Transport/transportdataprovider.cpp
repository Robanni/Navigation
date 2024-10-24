#include "transportdataprovider.h"

TransportDataProvider::TransportDataProvider(QObject *parent)
    : QObject{parent}
{


}

void TransportDataProvider::resiveTransportData(TransportData data)
{
    _transportData = data;
    emit transportDataResived(_transportData);
}

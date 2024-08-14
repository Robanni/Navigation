#ifndef NMEAREADER_H
#define NMEAREADER_H

#include <vector>
#include <string>
#include <QDebug>

#include "Support/SupportFunctions.h"
#include "Support/SupportStructers.h"

class NmeaReader
{
private:
    NmeaData dStore;

private:
    void ReadGGA(std::vector<std::string> data)
    {
        dStore.time = std::stoi(data[1]);
        dStore.latitude = sf::convertToDecimal(data[2], data[3]);
        dStore.longitude = sf::convertToDecimal(data[4], data[5]);
        dStore.satellites = std::stoi(data[7]);


        qDebug()<<"<----------------->";
        qDebug()<<"gga";
        qDebug() << dStore.time;
        qDebug() << dStore.latitude;
        qDebug() << dStore.longitude;
        qDebug() << dStore.satellites;
        qDebug()<<"<----------------->";

        if(dStore.time == std::stoi(data[1])) dStore.timeEquality = true;
    }

    void ReadRMC(std::vector<std::string> data)
    {
        dStore.time = std::stoi(data[1]);
        dStore.latitude = sf::convertToDecimal(data[3], data[4]);
        dStore.longitude = sf::convertToDecimal(data[5], data[6]);
        dStore.speed = std::stod(data[7]);
        dStore.course = std::stod(data[8]);

        qDebug()<<"<----------------->";
        qDebug()<<"rmc";
        qDebug() << dStore.time;
        qDebug() << dStore.latitude;
        qDebug() << dStore.longitude;
        qDebug() << dStore.speed;
        qDebug()<<"<----------------->";

        if(dStore.time == std::stoi(data[1])) dStore.timeEquality = true;
    }

public:
    NmeaData GetNmeaData(std::string nmeaSentence)
    {
        //bool ign = true;
        //if (dStore.time == 0) ign = false;

        // Убираем лишнее
        size_t start = nmeaSentence.find('$') + 1;
        size_t end = nmeaSentence.find('*');
        std::string content = nmeaSentence.substr(start, end - start);

        //Делим строку
        std::vector<std::string> data = sf::split(content, ',');



        if (data[0] == "GPRMC")
        {
            ReadRMC(data);

        }
        else if (data[0] == "GPGGA")
        {
            ReadGGA(data);
        }

        return dStore;

    }
};

#endif // NMEAREADER_H

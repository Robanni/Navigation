#ifndef FILENMEAINPUTSTUB_H
#define FILENMEAINPUTSTUB_H

#include "Support/Interfaces.h"
#include "Nmea/NmeaReader.h"

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QTimer>



class FileNmeaInputStub: public QObject
{
    Q_OBJECT


private:
    IGetNavigationData* _dataInputer;

    QVector<QString>::Iterator _nmeaLineIterator;

    int _pathIndex = 2;
    int _timerInterval = 100;

    NmeaReader _nmeaReader;

private:
    QVector<QString> _pathVector;
    QVector<QString> _nmeaDataLine;


public:
    explicit FileNmeaInputStub(IGetNavigationData* inputer,QObject *parent = nullptr): QObject{parent}
    {
        _dataInputer = inputer;
        _dataInputer->SetCoordinates(51,39,0);

        _pathVector.append("G:/QtProjects/ANEW/Navigation/line.nmea");
        _pathVector.append("G:/QtProjects/ANEW/Navigation/circle.nmea");
        _pathVector.append("G:/QtProjects/ANEW/Navigation/CircleRound.nmea");

        ParseDataFromFile();
        _nmeaLineIterator = _nmeaDataLine.begin();

        QTimer *timer = new QTimer(this);
        connect(timer,SIGNAL(timeout()),this,SLOT(SendData()));
        timer->start(_timerInterval);
    }

private:
    void ParseDataFromFile()
    {
        QFile file(_pathVector[_pathIndex]);

        if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        {
            qDebug() << "Не удалось открыть файл:" << file.errorString();
            return;
        }

        QTextStream in(&file);

        while (!in.atEnd())
        {
                QString line = in.readLine();
                _nmeaDataLine.append(line);
        }

        file.close();

    }

private slots:
    void SendData()
    {
        auto a = _nmeaReader.GetNmeaData(_nmeaLineIterator->toStdString());

        qDebug()<<a.latitude;

        _dataInputer->SetCoordinates(a.latitude,a.longitude,a.course);

        if(_nmeaLineIterator ==_nmeaDataLine.end()-1)_nmeaLineIterator = _nmeaDataLine.begin();
        else _nmeaLineIterator++;
    }

};

#endif // FILENMEAINPUTSTUB_H

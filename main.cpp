#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Transport/transportdataprovider.h"
#include "maphandler.h"
#include "KeyboardInputStub.h"
#include "Nmea/FileNmeaInputStub.h"


int main(int argc, char *argv[])
{
    //registration of types
    qRegisterMetaType<Section>("Section");
    qRegisterMetaType<NormalizedFloat>("NormalizedFloat");
    qRegisterMetaType<PairWrapper>("PairWrapper");
    qRegisterMetaType<NmeaData>("NmeaData");
    qRegisterMetaType<TransportData>("TransportData");
    //end of registration

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);


    //Затычка с созданием массива секций. в финале будет приходить из меню
    QVector<Section> sections;
    sections.append(Section(QPair<bool,int>(true,0)));
    sections.append(Section(QPair<bool,int>(true,1)));
    sections.append(Section(QPair<bool,int>(true,2)));
    sections.append(Section(QPair<bool,int>(true,3)));

    sections.append(Section(QPair<bool,int>(false,0)));
    sections.append(Section(QPair<bool,int>(false,1)));
    sections.append(Section(QPair<bool,int>(false,2)));
    sections.append(Section(QPair<bool,int>(false,3)));

    //Getting Transport Data
    TransportDataProvider tDProvider;
    TransportData td;
    td.CrossbarLenght = 20;
    td.NumberOfSections = sections.size();
    //Getting Transport Data

    TransportController* tController = new TransportController(sections);
    NavigationController *navController = new NavigationController(tController);

    MapHandler* mapHandler = new MapHandler(navController,tController);

    //<-Заглушка на клаву
    KeyboardInputStub input(dynamic_cast<IGetNavigationData*>(navController));
    app.installEventFilter(&input);
    //Заглушка на клаву ->

    //<-Заглушка на NMEA
    //FileNmeaInputStub stub(dynamic_cast<IGetNavigationData*>(navController));
    //Заглушка на NMEA->

    //All signal-slot connections
    QObject::connect(&tDProvider,&TransportDataProvider::transportDataResived,
                     navController,&NavigationController::onTransportDataReceived);
    QObject::connect(&tDProvider,&TransportDataProvider::transportDataResived,
                     mapHandler,&MapHandler::onTransportDataReceived);
    //end of All signal-slot connections

    //emiting transport data
    QTimer::singleShot(1000, [&tDProvider,td]() {
        tDProvider.resiveTransportData(td);
    });
    //emiting transport data

    engine.rootContext()->setContextProperty("MapHandler", mapHandler);
    engine.load(url);

    return app.exec();
}

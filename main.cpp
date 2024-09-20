#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "maphandler.h"
#include "KeyboardInputStub.h"
#include "Nmea/FileNmeaInputStub.h"


int main(int argc, char *argv[])
{
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
    sections.append(Section(QPair<bool,int>(false,0)));
    sections.append(Section(QPair<bool,int>(false,1)));
    sections.append(Section(QPair<bool,int>(false,2)));
    sections.append(Section(QPair<bool,int>(false,1)));
    sections.append(Section(QPair<bool,int>(true,0)));
    sections.append(Section(QPair<bool,int>(true,1)));
    sections.append(Section(QPair<bool,int>(true,2)));


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

    engine.rootContext()->setContextProperty("MapHandler", mapHandler);
    engine.load(url);

    return app.exec();
}

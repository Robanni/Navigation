#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "maphandler.h"
#include "KeyboardInputStub.h"


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

    TransportController* tController = new TransportController();
    NavigationController *navController = new NavigationController();

    MapHandler* mapHandler = new MapHandler(navController,tController);

    KeyboardInputStub input(dynamic_cast<IGetNavigationData*>(navController));

    app.installEventFilter(&input);

    engine.rootContext()->setContextProperty("MapHandler", mapHandler);
    engine.load(url);

    return app.exec();
}

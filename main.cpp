#include "mainwindow.h"
#include "settings.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    //qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    //QQuickWindow::setGraphicsApi(QSGRendererInterface::OpenGL);
    QApplication a(argc, argv);
    qmlRegisterType<Settings>("MyClass",1,0,"Settings");
    QQuickView view;
    view.setSource(QUrl("qrc:/QML/MainWindow.qml"));
    view.show();

    //MainWindow w;
    // w.resize(1024,600);
    //w.show();

    return a.exec();
}

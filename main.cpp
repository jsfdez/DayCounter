#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "imagesaver.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    ImageSaver imageSaver;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("imageSaver", &imageSaver);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

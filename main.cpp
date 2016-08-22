#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>

#include "imagesaver.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    ImageSaver imageSaver;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("imageSaver", &imageSaver);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

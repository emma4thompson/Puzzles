#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "magic_8_ball.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    magic_8_ball ball;

    engine.rootContext()->setContextProperty("Cursed_8_ball", &ball);

    // Call main.qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

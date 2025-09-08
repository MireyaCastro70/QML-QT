#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "dataentrymodel.h"
#include "roleentrymodel.h"
#include "dynamicentrymodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<DataEntryModel>("org.example", 1, 0, "DataEntryModel");
    qmlRegisterType<RoleEntryModel>("org.example", 1, 0, "RoleEntryModel");
    qmlRegisterType<DynamicEntryModel>("org.example", 1, 0, "DynamicEntryModel");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}



#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QFile>
#include <QQmlContext>
#include <QSqlTableModel>

#include <Details.h>
#include <Credentials.h>
#include <Results.h>
#include <Tests.h>
#include <Wifi_Details.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
    if (!QFile::exists(QStringLiteral("/usr/share/tcr/pcr.db")))
        db.setDatabaseName(QStringLiteral("D:/QML_Internship/PCR/PCR-Model/pcr.db"));
    else
        db.setDatabaseName(QStringLiteral("/usr/share/tcr/pcr.db"));
    db.open();
    Details details(nullptr,db);
    Credentials credentials(nullptr,db);
    Results results(nullptr,db);
    Tests tests(nullptr,db);
    Wifi_Details wifi_Details(nullptr,db);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("detailsTable", &details);
    engine.rootContext()->setContextProperty("credentialsTable", &credentials);
    engine.rootContext()->setContextProperty("resultsTable", &results);
    engine.rootContext()->setContextProperty("testsTable", &tests);
    engine.rootContext()->setContextProperty("wifiInfoTable", &wifi_Details);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

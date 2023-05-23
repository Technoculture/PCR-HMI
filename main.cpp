#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QFile>
#include <QQmlContext>
#include <QSqlTableModel>

#include <Details.h>

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

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("detailsTable", &details);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

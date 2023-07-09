#include "Tests.h"

#include <QSqlRecord>
#include <QDebug>

Tests::Tests(QObject *parent, QSqlDatabase database)
    : QSqlTableModel(parent, database)
{
    setTable(QStringLiteral("tests"));
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    select();
}

QHash<int, QByteArray> Tests::roleNames() const
{
    QHash<int, QByteArray> roles;
    for(int i = 0; i < columnCount(); i++){
        roles[Qt::UserRole + 1 + i] = headerData(i, Qt::Horizontal).toByteArray();
//        qDebug()<<roles[Qt::UserRole + 1 + i];
    }
    return roles;
}

QVariant Tests::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() > rowCount() || role < 0 || role > (columnCount() + Qt::UserRole + 1))
        return QVariant();
    if( role < Qt::UserRole)
        return (QSqlTableModel::data(index, role));
    else
        return QSqlTableModel::data(QSqlTableModel::index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
}

QVariant Tests::roleFromRow(int row, QString roleName)
{
    QSqlRecord record = QSqlTableModel::record(row);
    return record.value(roleName);
}

void Tests::removeRow(int row)
{
    removeRows(row, 1, QModelIndex());
    submitAll();
}

void Tests::addRow(int row, QString newData)
{
    QStringList data = newData.split(";", Qt::KeepEmptyParts);
    QSqlRecord newRecord = record();

    if (row == -1)
        newRecord.setGenerated(QStringLiteral("id"), true);
    else
        newRecord = record(row);
    newRecord.setValue(QStringLiteral("test_name"), data.at(0));
    newRecord.setValue(QStringLiteral("rt_process"), data.at(1));
    newRecord.setValue(QStringLiteral("hot_process"), data.at(2));
    newRecord.setValue(QStringLiteral("denaturation"), data.at(3));
    newRecord.setValue(QStringLiteral("annealing"), data.at(4));
    newRecord.setValue(QStringLiteral("extension"), data.at(5));
    newRecord.setValue(QStringLiteral("final_extension"), data.at(6));
    newRecord.setValue(QStringLiteral("temperature"), data.at(7));
    newRecord.setValue(QStringLiteral("time"), data.at(8));
    newRecord.setValue(QStringLiteral("loops"), data.at(9));

    if (row == -1)
        insertRecord(row, newRecord);
    else
        setRecord(row, newRecord);

    submitAll();
    qDebug()<<"Database Updated: " << newRecord;
}

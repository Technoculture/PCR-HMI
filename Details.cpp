#include "Details.h"

#include <QSqlRecord>
#include <QDebug>

Details::Details(QObject *parent, QSqlDatabase database)
    : QSqlTableModel(parent, database)
{
    setTable(QStringLiteral("details"));
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    select();
}

QHash<int, QByteArray> Details::roleNames() const
{
    QHash<int, QByteArray> roles;
    for(int i = 0; i < columnCount(); i++){
        roles[Qt::UserRole + 1 + i] = headerData(i, Qt::Horizontal).toByteArray();
//        qDebug()<<roles[Qt::UserRole + 1 + i];
    }
    return roles;
}

QVariant Details::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() > rowCount() || role < 0 || role > (columnCount() + Qt::UserRole + 1))
        return QVariant();
    if( role < Qt::UserRole)
        return (QSqlTableModel::data(index, role));
    else
        return QSqlTableModel::data(QSqlTableModel::index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
}

QVariant Details::roleFromRow(int row, QString roleName)
{
    QSqlRecord record = QSqlTableModel::record(row);
    return record.value(roleName);
}

void Details::removeRow(int row)
{
    removeRows(row, 1, QModelIndex());
    submitAll();
}

void Details::addRow(int row, QString newData)
{
    QStringList data = newData.split(";", Qt::KeepEmptyParts);
    QSqlRecord newRecord = record();

    if (row == -1)
        newRecord.setGenerated(QStringLiteral("id"), true);
    else
        newRecord = record(row);
    newRecord.setValue(QStringLiteral("patient_id"), data.at(0));
    newRecord.setValue(QStringLiteral("patient_name"), data.at(1));
    newRecord.setValue(QStringLiteral("sex"), data.at(2));
    newRecord.setValue(QStringLiteral("age"), data.at(3));
    newRecord.setValue(QStringLiteral("test_name"), data.at(4));
    newRecord.setValue(QStringLiteral("doctor"), data.at(5));
    newRecord.setValue(QStringLiteral("timestamp"), data.at(6));

    if (row == -1)
        insertRecord(row, newRecord);
    else
        setRecord(row, newRecord);

    submitAll();
    qDebug()<<"Database Updated: " << newRecord;
}

#ifndef RESULTS_H
#define RESULTS_H

#include <QSqlTableModel>

class Results : public QSqlTableModel
{
    Q_OBJECT
public:
    Results(QObject* parent = nullptr, QSqlDatabase database = QSqlDatabase());
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QVariant roleFromRow(int row, QString roleName);
    Q_INVOKABLE void removeRow(int row);
    Q_INVOKABLE void addRow(int row, QString newData);
};

#endif // RESULTS_H

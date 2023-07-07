#ifndef CREDENTIALS_H
#define CREDENTIALS_H
#include <QSqlTableModel>

class Credentials : public QSqlTableModel
{
    Q_OBJECT
public:
    Credentials(QObject* parent = nullptr, QSqlDatabase database = QSqlDatabase());
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QVariant roleFromRow(int row, QString roleName);
    Q_INVOKABLE void removeRow(int row);
    Q_INVOKABLE void addRow(int row, QString newData);
};

#endif // CREDENTIALS_H

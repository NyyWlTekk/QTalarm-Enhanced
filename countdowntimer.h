#ifndef COUNTDOWNTIMER_H
#define COUNTDOWNTIMER_H

#include <QDialog>
#include <QTime>

// Forward deklarace třídy UI
namespace Ui {
class CountdownTimer;
}

class CountdownTimer : public QDialog
{
    Q_OBJECT

public:
    explicit CountdownTimer(QWidget *parent = nullptr);
    ~CountdownTimer();
    int getTotalSeconds() const;

signals:
    void countdownFinished(int totalSeconds);

private:
    Ui::CountdownTimer *ui;
};

#endif // COUNTDOWNTIMER_H
#include "countdowntimer.h"
#include "ui_countdowntimer.h"

CountdownTimer::CountdownTimer(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::CountdownTimer)
{
    ui->setupUi(this);
}

CountdownTimer::~CountdownTimer()
{
    delete ui;
}

int CountdownTimer::getTotalSeconds() const {
    QTime t = ui->timeEdit->time();
    return (t.hour() * 3600) + (t.minute() * 60) + t.second();
}

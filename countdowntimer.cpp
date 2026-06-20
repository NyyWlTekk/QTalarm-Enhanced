#include "countdowntimer.h"
#include "ui_countdowntimer.h" // Tento soubor se generuje z .ui

CountdownTimer::CountdownTimer(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::CountdownTimer) // Správná inicializace
{
    ui->setupUi(this);
}

CountdownTimer::~CountdownTimer()
{
    delete ui;
}

int CountdownTimer::getTotalSeconds() const {
    // Předpokládám, že v Designeru se tvůj QTimeEdit jmenuje timeEdit
    QTime t = ui->timeEdit->time();
    return (t.hour() * 3600) + (t.minute() * 60) + t.second();
}
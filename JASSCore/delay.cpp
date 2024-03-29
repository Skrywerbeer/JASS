#include "delay.h"

Delay::Delay(QObject *parent) :
    Effect(parent), _buffer(_delay*JASS::SAMPLES_PER_US) {
	_type = Source::Type::Delay;
}

int Delay::delay() const {
	return _delay;
}

void Delay::setDelay(int delay) {
	if (delay == _delay)
		return;
	_delay = delay;
	_buffer.resize(_delay*JASS::SAMPLES_PER_US);
	emit delayChanged();
}

float Delay::newSample() {
	if (!_feedbackInput)
		return _buffer << _input->operator()();
	else
		return _buffer << _input->last();
}

void Delay::reset() {
	Effect::reset();
	_buffer.zero();
}

#include "vca.h"

VCA::VCA(QObject *parent) :
    Source(parent) {}

Source *VCA::input() const {
	return _input;
}

void VCA::setInput(Source *input) {
	if (input == _input)
		return;
	_input = input;
	emit inputChanged();
}

Source *VCA::cv() const {
	return _cv;
}

void VCA::setCV(Source *cv) {
	if (cv == _cv)
		return;
	_cv = cv;
	emit cvChanged();
}

float VCA::operator()() {
	return _input->operator()()*_cv->operator()();
}

void VCA::reset() {
	_input->reset();
	_cv->reset();
}

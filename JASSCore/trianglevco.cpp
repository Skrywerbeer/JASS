#include "trianglevco.h"

TriangleVCO::TriangleVCO(QObject *parent) :
    VCO(parent) {
	_type = Source::Type::TriangleVCO;
}

double TriangleVCO::slewRatio() const {
	return _slewRatio;
}

void TriangleVCO::setSlewRatio(double ratio) {
	if ((ratio < 0) || (ratio > 1))
		throw std::invalid_argument("Attempt to set slew ratio outside 0 < ratio < 1");
	if (ratio == _slewRatio)
		return;
	_slewRatio = ratio;
	emit slewRatioChanged();
}

float TriangleVCO::newSample() {
	const double frequency = _frequency->operator()() + _deviation*_cv->operator()();
	const int SAMPLES_PER_PERIOD = static_cast<double>(JASS::SAMPLE_RATE)/frequency;

	// _index == 0 when counting up, _index == 1 when counting down.
	if (_lastValue >= _amplitude->operator()())
		_index = 1;
	else if (_lastValue <= -_amplitude->operator()())
		_index = 0;
	if (!_index) {
		const int risingSampleCount = _slewRatio*SAMPLES_PER_PERIOD;
		if (risingSampleCount == 0) {
			_lastValue = _amplitude->operator()();
		}
		else {
			const double risingDelta = 2.0*_amplitude->operator()()/risingSampleCount;
			_lastValue += risingDelta;
		}
	}
	else {
		const int fallingSampleCount = (1.0 - _slewRatio)*SAMPLES_PER_PERIOD;
		if (fallingSampleCount == 0) {
			_lastValue = -_amplitude->operator()();
		}
		else {
			const double fallingDelta = 2.0*_amplitude->operator()()/fallingSampleCount;
			_lastValue -= fallingDelta;
		}
	}
	_lastValue += _offset->operator()();
	return _lastValue;
}

void TriangleVCO::reset() {
	_index = 0;
	_lastValue = 0;
	_cv->reset();
}

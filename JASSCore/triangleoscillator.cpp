#include <stdexcept>

#include "triangleoscillator.h"
#include "jass.h"

TriangleOscillator::TriangleOscillator(QObject *parent) :
    Oscillator(parent) {
	_type = Source::Type::TriangleOscillator;
}

Source *TriangleOscillator::slewRatio() const {
	return _slewRatio;
}

void TriangleOscillator::setSlewRatio(Source *ratio) {
//	if ((ratio < 0) || (ratio > 1))
//		throw std::invalid_argument("Attempt to set slew ratio outside 0 < ratio < 1");
	if (ratio == _slewRatio)
		return;
	_slewRatio = ratio;
	emit slewRatioChanged();
}

float TriangleOscillator::newSample() {
	const int SAMPLES_PER_PERIOD = static_cast<double>(JASS::SAMPLE_RATE)/_frequency->operator()();
	const double amplitude = _amplitude->operator()();
	const double slewRatio = _slewRatio->operator()();
	// _index == 0 when counting up, _index == 1 when counting down.
	if (_lastValue >= amplitude)
		_index = 1;
	else if (_lastValue <= -amplitude)
		_index = 0;
	if (!_index) {
		const int risingSampleCount = slewRatio*SAMPLES_PER_PERIOD;
		if (risingSampleCount == 0) {
			_lastValue = amplitude;
		}
		else {
			const double risingDelta = 2.0*amplitude/risingSampleCount;
			_lastValue += risingDelta;
		}
	}
	else {
		const int fallingSampleCount = (1.0 - slewRatio)*SAMPLES_PER_PERIOD;
		if (fallingSampleCount == 0) {
			_lastValue = -amplitude;
		}
		else {
			const double fallingDelta = 2.0*amplitude/fallingSampleCount;
			_lastValue -= fallingDelta;
		}
	}
//	_lastValue += _offset->operator()();
	return _lastValue + _offset->operator()();
}

void TriangleOscillator::reset() {
	Oscillator::reset();
	_index = 0;
	_lastValue = 0;
}


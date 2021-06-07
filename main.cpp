#include <QApplication>
#include <QQmlApplicationEngine>

#include "squareoscillator.h"
#include "triangleoscillator.h"
#include "sineoscillator.h"
#include "whitenoise.h"
#include "decay.h"
#include "jass.h"
using namespace std;

//class Constant : public Source {
//		float operator()() override {
//			return 1.0;
//		}
//		void reset() override {}
//};

int main(int argc, char **argv) {
	QApplication app(argc, argv);
	QQmlApplicationEngine engine("qrc:/qml/main.qml");

	return app.exec();

//	TriangleOscillator osc;
//	osc.setFrequency(440);
//	osc.setAmplitude(0.1);
//	osc.setSlewRatio(0.1);
//	std::vector<float> data(512);
//	osc >> data;
//	std::cout << data;

//	std::vector<float> data(44100);
//	DecayEffect decay;
//	decay.setRate(200);
//	SineOscillator osc;
//	decay.setInput(&osc);
//	decay >> data;
//	std::cout << data;

//	SquareOscillator osc;
//	osc.setDutyCycle(0.2);
//	osc.setAmplitude(0.1);
//	std::vector<float> data(512);
//	osc >> data;
//	std::cout << data;

//	WhiteNoise noise;
//	noise.setAmplitude(0.2);
//	std::vector<float> data(512);
//	noise >> data;
//	std::cout << data;
}

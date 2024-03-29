import QtQuick
import QtQuick.Controls

import JASSCore
import JASSView


ObjectModel {
    LibraryCard {
        label: "Exponential";
        plots: [
            Plot {
                input: Exponential {}
                width: 2;
                color: "darkorange";
            }
        ]
        controls: ListModel {
            ListElement {
                name: "initial";
                from: -10;
                to: 10;
                value: 0;
                step: 0.1;
                plotIndex: 0;
            }
            ListElement {
                name: "asymptote";
                from: -10;
                to: 10;
                value: 1;
                step: 0.1;
                plotIndex: 0;
            }
            ListElement {
                name: "timeConstant";
                from: 0;
                to: 10;
                value: 1;
                step: 0.1;
                plotIndex: 0;
            }
        }
    }
    LibraryCard {
        label: "Sine oscillator";
        plots: [
            Plot {
                input: SineOscillator {}
                width: 2;
                color: "darkorange";
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 440;
                value: 2;
                step: 1;
                plotIndex: 0;
            }
            ListElement {
                name: "amplitude";
                from: 0;
                to: 1;
                value: 0.5;
                step: 0.01;
                plotIndex: 0;
            }
            ListElement {
                name: "offset";
                from: -10;
                to: 10;
                value: 0;
                step: 0.1;
                plotIndex: 0;
            }
        }
    }
    LibraryCard {
        label: "Square oscillator";
        plots: [
            Plot {
                input: SquareOscillator {}
                width: 2;
                color: "darkorange";
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 440;
                value: 2;
                step: 1;
                plotIndex: 0;
            }
            ListElement {
                name: "amplitude";
                from: 0;
                to: 1;
                value: 0.5;
                step: 0.01;
                plotIndex: 0;
            }
            ListElement {
                name: "dutyCycle";
                from: 0;
                to: 1;
                value: 0.5;
                step: 0.01
                plotIndex: 0;
            }
            ListElement {
                name: "offset";
                from: -10;
                to: 10;
                value: 0;
                step: 0.1;
                plotIndex: 0;
            }
        }
    }
    LibraryCard {
        label: "Triangle oscillator";
        plots: [
            Plot {
                input: TriangleOscillator {}
                width: 2;
                color: "darkorange";
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 440;
                value: 2;
                step: 1;
                plotIndex: 0;
            }
            ListElement {
                name: "amplitude";
                from: 0;
                to: 1;
                value: 0.5;
                step: 0.01;
                plotIndex: 0;
            }
            ListElement {
                name: "slewRatio";
                from: 0;
                to: 1;
                value: 0.5;
                step: 0.01;
                plotIndex: 0;
            }
            ListElement {
                name: "offset";
                from: -10;
                to: 10;
                value: 0;
                step: 0.1;
                plotIndex: 0;
            }
        }
    }
    LibraryCard {
        label: "Amplitude modulated sine oscillator";
        plots: [
            Plot {
                input: SineOscillator {amplitude: sqr1;}
                color: "darkorange";
                width: 2;
            },
            Plot {
                input: SquareOscillator {
                    id: sqr1;
                    offset: Constant {value: 0.5;}
//                    amplitude: Constant {value: 0.5;}
                }
                color: "chartreuse";
                width: 2;
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 200;
                value: 50;
                step: 0.1;
                plotIndex: 0;
            }
            ListElement {
                name: "frequency";
                from: 1;
                to: 5;
                value: 5;
                step: 0.01;
                plotIndex: 1;
            }
            ListElement {
                name: "amplitude";
                from: 0;
                to: 0.5;
                value: 0.5;
                step: 0.01;
                plotIndex: 1;
            }
        }
    }
    LibraryCard {
        label: "Sine oscillator, exponential amplitude";
        plots: [
            Plot {
                input: SineOscillator {amplitude: exp1;}
                color: "darkorange";
                width: 2;
            },
            Plot {
                input: Exponential {
                    id: exp1;
                }
                color: "chartreuse";
                width: 2;
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 200;
                value: 50;
                step: 0.1;
                plotIndex: 0;
            }
            ListElement {
                name: "timeConstant";
                from: 0.1;
                to: 5;
                value: 1;
                step: 0.01;
                plotIndex: 1;
            }
        }
    }
    LibraryCard {
        label: "Sine oscillator, exponential frequency";
        plots: [
            Plot {
                input: SineOscillator {frequency: exp2;}
                color: "darkorange";
                width: 2;
            },
            Plot {
                input: Exponential {
                    id: exp2;
                }
                color: "chartreuse";
                width: 2;
            }
        ]
        controls: ListModel {
            ListElement {
                name: "initial";
                from: 1;
                to: 440;
                value: 0;
                step: 1;
                plotIndex: 1;
            }
            ListElement {
                name: "asymptote";
                from: 1;
                to: 440;
                value: 10;
                step: 1;
                plotIndex: 1;
            }
            ListElement {
                name: "timeConstant";
                from: 0;
                to: 10;
                value: 0.1;
                step: 0.1;
                plotIndex: 1;
            }
        }
    }
    LibraryCard {
        label: "Frequency modulated sine oscillator";
        plots: [
            Plot {
                input: SineOscillator {frequency: sine1;}
                color: "darkorange";
                width: 2;
            },
            Plot {
                input: SineOscillator {
                    id: sine1;
                }
                color: "chartreuse";
                width: 2;
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 10;
                value: 1;
                step: 0.1;
                plotIndex: 1;
            }
            ListElement {
                name: "offset";
                from: 0.1;
                to: 5;
                value: 2;
                step: 0.01;
                plotIndex: 1;
            }
            ListElement {
                name: "amplitude";
                from: 0.1;
                to: 5;
                value: 1;
                step: 0.01;
                plotIndex: 1;
            }
        }
    }
    LibraryCard {
        label: "Sine modulated PWM";
        plots: [
            Plot {
                input: SquareOscillator {
                    dutyCycle: sine2;
                    frequency: Constant {value: 20;}
                }
                color: "darkorange";
                width: 2;
            },
            Plot {
                input: SineOscillator {
                    id: sine2;
                }
                color: "chartreuse";
                width: 2;
            }
        ]
        controls: ListModel {
            ListElement {
                name: "frequency";
                from: 0;
                to: 10;
                value: 1;
                step: 0.1;
                plotIndex: 1;
            }
            ListElement {
                name: "offset";
                from: 0.1;
                to: 5;
                value: 0.5;
                step: 0.01;
                plotIndex: 1;
            }
            ListElement {
                name: "amplitude";
                from: 0.1;
                to: 5;
                value: 0.4;
                step: 0.01;
                plotIndex: 1;
            }
        }
    }
}

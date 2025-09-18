#include <iostream>

class Car {
	int wheels;
	std::string color;
	int type;

	public:
		Car(int w, std::string clr, int t): wheels(w), color(clr), type(t) {};

	void display() {
		std::cout << "Wheels count: " << wheels << ", color: " << color << std::endl;
	}

};

namespace CarNamespace {
	void display() {
		std::cout << "via name space Wheels count: " << wheels << ", color: " << color << std::endl;
	}
};

typedef struct {
	int wheels;
	int type:4;
} CarStruct;

#include <dog.h>

Dog::Dog(){}
Dog::~Dog(){}

Dog::Dog(std::string n, int a){
    age = a;
    name = n;
}

void Dog::printInfo(){
    std::printf("This dog names %s, is %d years-old\n",name.c_str(),age);
}


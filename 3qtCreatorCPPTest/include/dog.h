#ifndef DOG_H
#define DOG_H

#include <iostream>

class Dog{
public:
    int age;
    std::string name;
    int weight;

    Dog();
    ~Dog();

    Dog(std::string n, int a);
    void printInfo();

private:
    int estimateWeight(int age);
};

#endif // DOG_H

#ifdef DOG_H
#define DOG_H

#include <iostream>
#include <cat.h>

class Dog{
public:
    int age;
    std::string name;
    Cat bestfriend;

    Dog();
    ~Dog();

    Dog(std::string name, int age);
    void printInfo();

private:
    int estimateWeight(int age);
}
#endif

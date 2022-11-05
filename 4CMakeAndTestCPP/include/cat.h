#ifdef CAT_H
#define CAT_H

#include <iostream>

class Cat{
public:
    int age;
    std::string name;

    Cat();
    ~Cat();

    Cat(std::string name, int age);
    void printInfo();

private:
    int estimateWeight(int age);
}
#endif

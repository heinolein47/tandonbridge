#include <iostream>
using namespace std;

class Thing{
public:
    Thing(int num) : myNum(num) {};
    //int getNum() { return myNum; };
    friend int nummy(Thing &);
private:
    int myNum;
};

int nummy(Thing &myThing){  cout << "I'm a friend of Thing. Thing's num is: " << myThing.myNum<<endl;}

int main(){
    Thing duh(47);
    nummy(duh);
}

#include <string>
class MetaObject {
public:
std::string name;
};
template <const MetaObject &MO> static constexpr const MetaObject *aObject()
    {
        return &MO;
    }
struct SuperData {
  const MetaObject *direct;
};
class Object  {
public:
static const MetaObject staticMetaObject;
};


 template <const MetaObject &MO> static constexpr SuperData link()
        { return SuperData{aObject<Object::staticMetaObject>()}; }




class WhatEver: public Object  {
public:
};
#ifdef BUG

[[clang::require_constant_initialization]]  const SuperData constexpr ptr1 =link<Object::staticMetaObject>();
#endif
int main() {

printf("%p\n",aObject<Object::staticMetaObject>());
#ifdef BUG
printf("%p\n",&ptr1);
#endif

}

#include <string>
class MetaObject {
public:
std::string name;
};


class __attribute__((visibility("default"))) Object {
public:
static const MetaObject staticMetaObject;
};
const MetaObject Object::staticMetaObject = MetaObject();
struct SuperData {
  const MetaObject *direct;
};
template <const MetaObject &MO> static constexpr const MetaObject *aObject()
    {
        return &MO;
    }
        template <const MetaObject &MO> static constexpr SuperData link()
        { return SuperData{aObject<Object::staticMetaObject>()}; }


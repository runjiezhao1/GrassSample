#include <iostream>
#include <vector>
#include <glm/glm/glm.hpp>

struct blade
{
    glm::vec4 v0;
    glm::vec4 v1;
    glm::vec4 v2;
    glm::vec4 up;
};


class grass
{
public:
    std::vector<blade> blades;
    grass();
    ~grass();
    void generateBlades(glm::vec3);
};

grass::grass()
{
}

grass::~grass()
{
}

void grass::generateBlades(glm::vec3 pos){
    
}

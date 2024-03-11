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
    static std::vector<float> generateBlades();
};

grass::grass()
{
}

grass::~grass()
{
}

std::vector<float> grass::generateBlades(){
    std::vector<float> grassLand;
    for(int i = 0; i < 200; i++){
        for(int j = 0; j < 200; j++){
            float posx = (i + (rand() % 10) / 10.f) / 3.f;
            float posy = (j + (rand() % 10) / 10.f) / 3.f;
            //generate v0
            float height = (rand() % 20 + 10.0f) / 10.f;
            //x pos
            grassLand.push_back(posx);
            //y pos
            grassLand.push_back(0);
            //z pos
            grassLand.push_back(posy);
            //orientation of grass
            grassLand.push_back((rand() % 314) / 100.f);
            //generate v1
            //x pos
            grassLand.push_back(posx);
            //y pos
            grassLand.push_back(height);
            //z pos
            grassLand.push_back(posy);
            //radius
            grassLand.push_back(height);
            //generate v2
            //x pos
            grassLand.push_back(posx);
            //y pos
            grassLand.push_back(height);
            //z pos
            grassLand.push_back(posy);
            //radius
            grassLand.push_back(0.5f);
            //generate up
            //x pos
            grassLand.push_back(0);
            //y pos
            grassLand.push_back(height);
            //z pos
            grassLand.push_back(0);
            //radius
            grassLand.push_back(0.7f);
        }
    }
    return grassLand;
}

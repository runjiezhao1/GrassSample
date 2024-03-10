#version 450 core
out vec4 FragColor;

in vec3 TexCoords;

uniform samplerCube skybox;

void main()
{    
    //FragColor = vec4(1,0,1,0.5f);
    //FragColor = vec4(TexCoords.x,TexCoords.y,TexCoords.z,1.f);
    FragColor = texture(skybox, TexCoords);
}
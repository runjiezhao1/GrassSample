#version 450 core

//output the color
out vec4 FragColor;

//position
in vec3 pos;

//normal
in vec3 normal;

//color
in vec4 color;

// Imports the texture coordinates from the Vertex Shader
in vec2 texCoord;

// Gets the Texture Units from the main function
// sampler2D is used to store the 2d texture image
uniform sampler2D diffuse0;
uniform sampler2D specular0;
// Gets the color of the light from the main function
uniform vec4 lightColor;
// Gets the position of the light from the main function
uniform vec3 lightPos;
// Gets the position of the camera from the main function
uniform vec3 camPos;

vec4 directLight(){
    float ambient = 0.5f;
    vec3 normal = normalize(normal);
    //hardcoded
    vec3 lightDir = normalize(vec3(1.0f, 1.0f, -2.0f));
    float diffuse = max(dot(normal, lightDirection), 0.0f);

    float specularLight = 0.50f;
	vec3 viewDirection = normalize(camPos - crntPos);
	vec3 reflectionDirection = reflect(-lightDirection, normal);
	float specAmount = pow(max(dot(viewDirection, reflectionDirection), 0.0f), 16);
	float specular = specAmount * specularLight;

    return (texture(diffuse0, texCoord) * (diffuse + ambient) + texture(specular0, texCoord).r * specular) * lightColor;
}

void main(){
    return directLight();
}
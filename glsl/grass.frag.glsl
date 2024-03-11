#version 450 core

in vec3 normal;
in vec2 uv;


layout(location = 0) out vec4 outColor;

void main() {
  vec3 upperColor = vec3(0.4,1,0.1);
  vec3 lowerColor = vec3(0.0,0.2,0.1);

  vec3 sunDirection = normalize(vec3(-1.0, 5.0, -3.0));

  float sunNor = clamp(dot(normal, sunDirection), 0.5, 1.0);

  vec3 mixedColor = mix(lowerColor, upperColor, uv.y);

  outColor = vec4(mixedColor*sunNor, 1.0);
}
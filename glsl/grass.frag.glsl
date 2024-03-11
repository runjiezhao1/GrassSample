#version 450 core

// layout(binding = 0) uniform CameraBufferObject {
//     mat4 view;
//     mat4 proj;
// } camera;


in vec3 normal;
in vec2 uv;


layout(location = 0) out vec4 outColor;

void main() {
  vec3 normal = normal;
  vec2 uv = uv;

  vec3 upperColor = vec3(0.4,1,0.1);
  vec3 lowerColor = vec3(0.0,0.2,0.1);

  vec3 sunDirection = normalize(vec3(-1.0, 5.0, -3.0));

  vec3 upperDarkColor = vec3(0.2,0.75,0.05);
  vec3 lowerDarkColor = vec3(0.0,0.5,0.05);

  float NoL = clamp(dot(normal, sunDirection), 0.5, 1.0);

  vec3 mixedColor = mix(lowerColor, upperColor, uv.y);

  outColor = vec4(mixedColor*NoL, 1.0);
}
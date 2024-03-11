#version 450 core

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 up;

// out VS_OUT
// {
//   vec4 v1;
//   vec4 v2;
//   vec4 up;
//   vec4 dir;
// } vs_out;

out vec4 vv1;
out vec4 vv2;
out vec4 vup;
out vec4 vdir;

void main() {
  vv1 = v1;
  vv2 = v2;
  vup = vec4(normalize(up.xyz), up.w);
  float angle = v0.w;
  vec3 dir = normalize(cross(vup.xyz, vec3(sin(angle),0,cos(angle))));

  vdir = vec4(dir, 0.0);

  gl_Position = v0;
}
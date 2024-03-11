#version 450 core

layout(vertices = 1) out;

uniform mat4 view;
uniform mat4 proj;
uniform mat4 model;

in vec4 vv1[];
in vec4 vv2[];
in vec4 vup[];
in vec4 vdir[];

out vec4 tv1[];
out vec4 tv2[];
out vec4 tup[];
out vec4 tdir[];



void main() {
  gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

  tv1[gl_InvocationID] = vv1[gl_InvocationID];
  tv2[gl_InvocationID] = vv2[gl_InvocationID];
  tup[gl_InvocationID] = vup[gl_InvocationID];
  tdir[gl_InvocationID] = vdir[gl_InvocationID];
  
  float z1 = (proj * view * vec4(tv1[gl_InvocationID].xyz, 1)).z;
  float z2 = (proj * view * vec4(tv2[gl_InvocationID].xyz, 1)).z;

  //less tessellation when far and more when near
  if (z1 < 0.8 && z2 < 0.8) {
    gl_TessLevelInner[0] = 12.0;
    gl_TessLevelInner[1] = 17.0;
    gl_TessLevelOuter[0] = 17.0;
    gl_TessLevelOuter[1] = 12.0;
    gl_TessLevelOuter[2] = 17.0;
    gl_TessLevelOuter[3] = 12.0;
  } else {
    gl_TessLevelInner[0] = 1.0;
    gl_TessLevelInner[1] = 3.0;
    gl_TessLevelOuter[0] = 3.0;
    gl_TessLevelOuter[1] = 1.0;
    gl_TessLevelOuter[2] = 3.0;
    gl_TessLevelOuter[3] = 1.0;
  }

}
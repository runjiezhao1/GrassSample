#version 450 core
layout(quads, fractional_odd_spacing, ccw) in;

uniform mat4 view;
uniform mat4 proj;

in vec4 tv1[];
in vec4 tv2[];
in vec4 tup[];
in vec4 tdir[];


out vec3 normal;
out vec2 uv;

void main() {
  const float u = gl_TessCoord.x;
  const float v = gl_TessCoord.y;

  const vec3 v0 = gl_in[0].gl_Position.xyz;
  const vec3 v1 = tv1[0].xyz;
  const vec3 v2 = tv2[0].xyz;
  const vec3 dir = tdir[0].xyz;
  const float width = tv2[0].w;
  
  //beizer curve
  const vec3 a = v0 + v * (v1 - v0);
  const vec3 b = v1 + v * (v2 - v1);

  //obtain the middle
  const vec3 c = a + v * (b - a);
  
  //calculate the point with width
  const vec3 c0 = c - dir * width * 0.5;
  const vec3 c1 = c + dir * width * 0.5;
  const vec3 t0 = normalize(b - a);

  const float t = u + 0.5 * v - u * v;
  const vec3 p = (1.0 - t) * c0 + t * c1;
  
  uv = vec2(u, v);
  normal = normalize(cross(t0, dir));
  gl_Position = proj * view * vec4(p, 1.0);
}
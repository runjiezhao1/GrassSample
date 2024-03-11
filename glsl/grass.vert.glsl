#version 450 core

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 up;

uniform float deltaTime;
uniform float currentTime;

out vec4 vv1;
out vec4 vv2;
out vec4 vup;
out vec4 vdir;

void main() {
  vec4 tempV2 = v2;
  vec4 tempV1 = v1;
  //apply gravity forces(we do not consider about the center of a gravity force at this time) and front gravity
  float m = 0.1;
  vec3 gravityDir = vec3(0,-1,0);
  float gravityForce = 9.8f;
  vec3 gE = gravityDir * m * gravityForce;
  vec3 grassDir = vec3(cos(v0.w),0,sin(v0.w));
  vec3 fDir = normalize(cross(up.xyz,grassDir));
  vec3 gF = 0.25f * length(gE) * fDir;
  vec3 G = gE + gF;
  
  //calculate wind force
  vec3 windDir = vec3(sin(currentTime * 3. / 1.0 + v0.x * 0.1 * 11 / 1.0), 0, sin(currentTime * 3. / 1.0 + v0.z * 0.2 * 11 / 1.0) * 0.1);
  vec3 windForce = 0.25 * 1.0 *windDir;
  float fd = 1 - abs(dot(normalize(windForce), normalize(v2.xyz - v0.xyz)));
  float fr = dot((v2.xyz - v0.xyz), up.xyz) / v1.w;
  float theta = fd * fr;
  vec3 w = windForce * theta;
  
  //calculate resistance force
  float resistance = up.w;
  vec3 r = (v0.xyz + up.xyz * tempV1.w - tempV2.xyz) * resistance;
  
  //calculate the pos of v1 based on v2 and v0
  tempV2.xyz += 0.5 * G + 0.5 * r + w;
  
  float lproj = length(tempV2.xyz - v0.xyz - up.xyz * dot((tempV2.xyz-v0.xyz), up.xyz));
  tempV1.xyz = v0.xyz + tempV1.w*up.xyz*max(1-lproj/v1.w, 0.05*max(lproj/tempV1.w, 1));
  
  vv1 = v1;
  vv2 = tempV2;
  vup = vec4(normalize(up.xyz), up.w);
  float angle = v0.w;
  vec3 dir = normalize(cross(vup.xyz, vec3(sin(angle),0,cos(angle))));

  vdir = vec4(dir, 0.0);

  gl_Position = v0;
}
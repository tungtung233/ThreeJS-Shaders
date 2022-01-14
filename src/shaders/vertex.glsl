// cannot console.log in glsl
// need semi-colon at the end of every line

// glsl is a typed language - have to declare every variable's type

//have to decare it's type
//float = has decimal point
float a = 1.21212;

//int = whole number
int b = 2;

// can't just add a float and int together
float c = a + float(b);

bool foo = true;



uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

void main(){
  gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}
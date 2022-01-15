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

vec2 coordinatesA = vec2(1.0, -2);

// you can't create an empty vector
// error -> 'vec2 coordinates = vec2();

// but you can put in just 1 value and it will apply it to all slots
vec3 coordinatesB = vec3(1.0);

vec3 coordinatesC1 = vec3(coordinatesA, 0.1); // => (1.0, -2, 0.1)

// vectors args => (x, y, z, w) or it can be (r, g, b, a)
vec3 coordinatesC2 = vec3(coordinatesA.x, coordinatesA.y, 0.1); // => (1.0, -2, 0.1)
vec3 coordinatesC3 = vec3(coordinatesA.r, coordinatesA.g, 0.1); // => (1.0, -2, 0.1)

// this is called swizzling -> but I find it kind of hard/confusing to follow
vec2 coordinatesD1 = coordinatesC2.xy; // => (1.0, -2)
vec2 coordinatesD2 = coordinatesC2.yx; // => (-2, 1.0)
vec2 coordinatesD3 = coordinatesC2.xz; // => (1.0, 0.1)

vec4 coordinatesE = vec4(1.0, 2.0, 3.0, 4.0);

// A function must start with the type of value that will be returned
float loremIpsum() {
  float varA = 1.0;
  float varB = 2.1;

  return varA + varB;
}

// If the function isn't supposed to return anythying, set the type to void'
void exampleFunction() {
  float varA = 1.0;
  float varB = 2.1;
}


uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

void main(){
  gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}
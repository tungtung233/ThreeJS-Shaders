// // the vertex shader's purpose is to positioin the vertices of the geometry. 
// // when using a vertex shader, its code will be applied to every vertex of the geometry
// // the vertex shader happens first - once the vertices are placed, the GPU knows what pixels of the geometry are visible and can proceed to the fragment shader

// // cannot console.log in glsl
// // need semi-colon at the end of every line

// // glsl is a typed language - have to declare every variable's type

// //have to decare it's type
// //float = has decimal point
// float a = 1.21212;

// //int = whole number
// int b = 2;

// // can't just add a float and int together
// float c = a + float(b);

// bool foo = true;

// vec2 coordinatesA = vec2(1.0, -2);

// // you can't create an empty vector
// // error -> 'vec2 coordinates = vec2();

// // but you can put in just 1 value and it will apply it to all slots
// vec3 coordinatesB = vec3(1.0);

// vec3 coordinatesC1 = vec3(coordinatesA, 0.1); // => (1.0, -2, 0.1)

// // vectors args => (x, y, z, w) or it can be (r, g, b, a)
// vec3 coordinatesC2 = vec3(coordinatesA.x, coordinatesA.y, 0.1); // => (1.0, -2, 0.1)
// vec3 coordinatesC3 = vec3(coordinatesA.r, coordinatesA.g, 0.1); // => (1.0, -2, 0.1)

// // this is called swizzling -> but I find it kind of hard/confusing to follow
// vec2 coordinatesD1 = coordinatesC2.xy; // => (1.0, -2)
// vec2 coordinatesD2 = coordinatesC2.yx; // => (-2, 1.0)
// vec2 coordinatesD3 = coordinatesC2.xz; // => (1.0, 0.1)

// vec4 coordinatesE = vec4(1.0, 2.0, 3.0, 4.0);

// // A function must start with the type of value that will be returned
// float loremIpsum() {
//   float varA = 1.0;
//   float varB = 2.1;

//   return varA + varB;
// }

// // If the function isn't supposed to return anythying, set the type to void'
// void exampleFunction() {
//   float varA = 1.0;
//   float varB = 2.1;
// }


// data that doesn't change between vertices is called a uniform (like mesh position or color)
// uniforms can be declared in any order, however, the order in which they are multiplied is important
// these matrices are provided by threejs already
// transform the coordinates into the clip space coordinates - after moving all your objects and the camera, any coordinates that fall outside of the clip space coordinates will get clipped
uniform mat4 projectionMatrix;

// apply transformations relative to the camera (position, rotation, field of view, near, far)
// e.g. if the camera looks to the left, then all the objects in view should move to the right. If the camera is further away, then the objects should look smaller. If my fov is small, then the objects should look bigger (like you're zooming in)
uniform mat4 viewMatrix;

// apply transformations relative to the mesh (position, rotation, scale) - don't have to actually write the matrices, threejs does it for you. 
// when applying transformations, the modelMatrix takes those transformations and turns it into a matrix. Then in gl_Position, those transformations get applied to the mesh's position
uniform mat4 modelMatrix;

uniform vec2 uFrequency;
uniform float uTime;

// data that does change between vertices is called an attribute (like their position)
// position is the location specified when creating the geometry
attribute vec3 position;

// our plane geometry automatically generates these coordinates - since it's an attribute, we can retrieve the uv coordinates in our vertex shader and pass them to our frag shader via varying
attribute vec2 uv;

varying vec2 vUv;

// attribute float aRandom;

// we can send data from the vertex shader to the fragment shader using 'varying'
// varying float vRandom;

void main(){
  // gl_Position already exists - notice how I didn't need to declare it, but we need to assign it
  // it will return a vec4 
  // this vec4 will be used to position the vector correctly on the render
  // obviously the first 3 values are used for x,y,z positioning. But the w value is used for ...perspective? I think it's usually 1.0

  // the order in which this is multiplied is important -
  // first we apply all the mesh's transformations, then we apply the camera transformations, then finally, check if they are in the clip space
  // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1);

  // not the correct way of moving things, but it is possible this way
  // the reason why this isn't the right way is because we aren't moving the actual object, we are moving the projected plane instead.
  // (imagine you are drawing on a piece of paper. Instead of changing the perspective inside the drawing, you just moved the piece of paper to another part of your desk)
  // gl_Position.x += 0.5; 

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
  modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

  // modelPosition.z += aRandom * 0.1;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;

  gl_Position = projectionPosition;

  // vRandom = aRandom;

  vUv = uv;
}

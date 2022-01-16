// the fragment shader's purpose is to color each visible fragement (pixel) of the geometry.

// the same fragment shader will be used for every visible fragment of the geometry

// the fragment shader is executed after the vertex shader

// highp can affect performance and might not work on some devices
// lowp can create bugs by the lack of precision
// usually we use mediump
// this is automatically handled when using ShaderMaterial
precision mediump float;

void main() {
  // same like gl_Position, gl_FragColor already exists, but we need to assign it
  // this puts a color on each visible fragment
  // this vec4 is just an rgba value, but instead of going up to 255, it goes to 1.0
  gl_FragColor = vec4(1.0, 0.0, 0.0, 0.5);
}
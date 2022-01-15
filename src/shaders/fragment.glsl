// the fragment shader's purpose is to color each visible fragement (pixel) of the geometry.

// the same fragment shader will be used for every visible fragment of the geometry

// the fragment shader is executed after the vertex shader

precision mediump float;

void main() {
  gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}
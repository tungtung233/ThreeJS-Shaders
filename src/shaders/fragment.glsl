// the fragment shader's purpose is to color each visible fragement (pixel) of the geometry.

// the same fragment shader will be used for every visible fragment of the geometry

// the fragment shader is executed after the vertex shader

// highp can affect performance and might not work on some devices
// lowp can create bugs by the lack of precision
// usually we use mediump
// this is automatically handled when using ShaderMaterial
// precision mediump float;

uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;
varying float vElevation;

// notice how this is the same line of code from the vertexShader -> this is how webGL can link the two together
// varying float vRandom;

void main() {
  // first parameter is the texture
  // second parameter consists of the coordinates of where to pick the color on that texture
  vec4 textureColor = texture2D(uTexture, vUv);

  textureColor.rgb *= vElevation + 0.85;

  // same like gl_Position, gl_FragColor already exists, but we need to assign it
  // this puts a color on each visible fragment
  // this vec4 is just an rgba value, but instead of going up to 255, it goes to 1.0
  // vRandom -> vertices closer to 1 on the z axis (aRandom applied to z axis positioning) will appear closer to white (rgb(1,1,1)) whilst vertices closer to 0 will look more blue (rgb(0,0,1)), with interpolation between the spikes
  gl_FragColor = textureColor;
}

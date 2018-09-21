void uranus(float uranusDiam, float uranus_x, float uranus_y) {
  pushMatrix();
    translate(uranus_x, uranus_y);
    globe = createShape(SPHERE, uranusDiam/2);
    globe.setTexture(uranusImg);
    noStroke();
    noFill();
    shape(globe);
  popMatrix();
}

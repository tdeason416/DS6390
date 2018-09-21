void earth(float earthDiam, float earth_x, float earth_y) {
  pushMatrix();
    translate(earth_x, earth_y);
    globe = createShape(SPHERE, earthDiam/2);
    globe.setTexture(earthImg);
    noStroke();
    noFill();
    shape(globe);
  popMatrix();
}

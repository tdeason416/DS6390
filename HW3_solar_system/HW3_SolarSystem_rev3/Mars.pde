void mars(float marsDiam, float mars_x, float mars_y) {
  pushMatrix();
    translate(mars_x, mars_y);
    globe = createShape(SPHERE, marsDiam/2);
    globe.setTexture(marsImg);
    noStroke();
    noFill();
    shape(globe);
  popMatrix();
}

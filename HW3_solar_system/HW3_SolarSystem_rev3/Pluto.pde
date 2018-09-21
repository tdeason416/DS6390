void pluto(float plutoDiam, float pluto_x, float pluto_y) {
  pushMatrix();
    translate(pluto_x, pluto_y);
    globe = createShape(SPHERE, plutoDiam/2);
    globe.setTexture(plutoImg);
    noStroke();
    noFill();
    shape(globe);
  popMatrix();
}

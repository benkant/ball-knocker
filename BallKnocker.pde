/**
 * $Id: BallKnocker.pde 30 2008-12-15 08:26:58Z btgiles $
 *
 * Copyright (C) 2008 Ben Giles
 * btgiles@gmail.com
 * bencode.googlecode.com
 *
 * Released under the GPL, Version 3
 * License available here: http://www.gnu.org/licenses/gpl.txt
 */
 
/*
  Kock a ball around the canvas (x, y) with a cube whose 
  location is centred on mouse x and y.
*/

import processing.opengl.*;

Ball b;
Knocker k;

void setup() {
  size(600, 400, OPENGL);
  b = new Ball();
  k = new Knocker();
  smooth();
  noStroke();
}

void draw() {
  background(153);
  
  process();
  render();
}

void process() {
  // move the knocker
  k.move(mouseX, mouseY, 0);
  
  // check for collision
  Vector3 collisionNormal = k.intersectsBall(b);
  if (collisionNormal != null) {
    println("BAM!! " + collisionNormal.toString());
    // respond to the collision
    collisionNormal.reverse();
    b.heading = collisionNormal;
  }
  
  b.move();
}  

void render() {
  lights();
  
  // draw the knocker
  pushMatrix();
  translate(k.x, k.y, k.z);
  fill(k.colour);
  box(k.w, k.h, k.d);
  popMatrix();
  
  // draw the ball
  pushMatrix();
  translate(b.x, b.y, b.z);
  fill(b.colour);
  sphere(b.radius);
  popMatrix();
}

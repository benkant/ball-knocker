/**
 * $Id: Ball.pde 30 2008-12-15 08:26:58Z btgiles $
 *
 * Copyright (C) 2008 Ben Giles
 * btgiles@gmail.com
 * bencode.googlecode.com
 *
 * Released under the GPL, Version 3
 * License available here: http://www.gnu.org/licenses/gpl.txt
 */

class Ball {
  float x, y, z;
  float radius;
  Vector3 heading;
  color colour;
  
  Ball() {
    this.x = width/2;
    this.y = height/2;
    this.z = 0.0f;
    heading = new Vector3(0.0f, 0.0f, 0.0f);
    colour = color(255, 0, 0);
    radius = 50.0f;
  }

  Vector3 centre() {
    return new Vector3(x, y, z);
  }
  
  void move() {
    x += heading.x;
    y += heading.y;
    z += heading.z;
  }
}

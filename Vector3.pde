/**
 * $Id: Vector3.pde 30 2008-12-15 08:26:58Z btgiles $
 *
 * Copyright (C) 2008 Ben Giles
 * btgiles@gmail.com
 * bencode.googlecode.com
 *
 * Released under the GPL, Version 3
 * License available here: http://www.gnu.org/licenses/gpl.txt
 */

class Vector3 {

  float x, y, z;

  Vector3() {
  }

  Vector3(float nx, float ny, float nz) {
    x = nx;
    y = ny;
    z = nz;
  }

  float distance(Vector3 v) {
    float dx = x - v.x;
    float dy = y - v.y;
    float dz = z - v.z;
    return sqrt(dx*dx + dy*dy + dz*dz);
  }

  // save doing a sqrt when comparing
  float distanceSquared(Vector3 v) {
    float dx = x - v.x;
    float dy = y - v.y;
    float dz = z - v.z;
    return dx*dx + dy*dy + dz*dz;
  }
  
  Vector3 subtract(Vector3 v) {
    return new Vector3(x - v.x, y - v.y, z - v.z);
  }
  
  void normalise() {
    float magSq = x*x + y*y + z*z;
    if (magSq > 0.0f) { // check for divide by zero
      float oneOverMag = 1.0f / sqrt(magSq);
      x *= oneOverMag;
      y *= oneOverMag;
      z *= oneOverMag;
    }
  }
  
  void reverse() {
    x = -x;
    y = -y;
    z = -z;
  }
  
  String toString() {
    return new String(x + ", " + y + ", " + z);
  }
  
  void print() {
    println(this.toString());
  }
}

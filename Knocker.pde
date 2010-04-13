/**
 * $Id: Knocker.pde 30 2008-12-15 08:26:58Z btgiles $
 *
 * Copyright (C) 2008 Ben Giles
 * btgiles@gmail.com
 * bencode.googlecode.com
 *
 * Released under the GPL, Version 3
 * License available here: http://www.gnu.org/licenses/gpl.txt
 */

class Knocker {
  float x, y, z;
  float w, d, h;
  color colour;
  
  Vector3 min = new Vector3();
  Vector3 max = new Vector3();
  
  Knocker() {
    x = 0.0f;
    y = 0.0f;
    z = 0.0f;
    colour = color(0, 255, 0);
    w = 50.0f;
    h = 50.0f;
    d = 50.0f;
    
    calcMinMax(); 
  }

  void calcMinMax() {
    min.x = x - w / 2;
    max.x = x + w / 2;
    min.y = y - h / 2;
    max.y = y + h / 2;
    min.z = z - d / 2;
    max.z = z + d / 2;
  }
  
  Vector3 centre() {
    return new Vector3(x, y, z);
  }
  
  void move(float nx, float ny, float nz) {
    x = nx;
    y = ny;
    z = nz;
    calcMinMax();
  }
  
  Vector3 intersectsBall(Ball b) {
    // find the closest point on the box to the centre of the ball
    Vector3 closestPoint = closestPointTo(b.centre());
    
    // check if it's within range
    if (b.centre().distanceSquared(closestPoint) < b.radius * b.radius) {
      // return the collision normal
      Vector3 collisionVector = k.centre().subtract(b.centre());
      collisionVector.normalise();
      return collisionVector;
    } else {
      return null;
    }
  }
  
  Vector3 closestPointTo(Vector3 p) {
    // push p into the box on each dimension
    Vector3 r = new Vector3();
    
    if (p.x < min.x) {
      r.x = min.x;
    } else if (p.x > max.x) {
      r.x = max.x;
    } else {
      r.x = p.x;
    }
    
    if (p.y < min.y) {
      r.y = min.y;
    } else if (p.y > max.y) {
      r.y = max.y;
    } else {
      r.y = p.y;
    }
    
    if (p.z < min.z) {
      r.z = min.z;
    } else if (p.z > max.z) {
      r.z = max.z;
    } else {
      r.z = p.z;
    }
    
    return r;
  }
}

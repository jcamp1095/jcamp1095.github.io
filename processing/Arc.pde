class Arc {
  float xpos, ypos, diameter;
  float value;
  String name;
  float firstAngle, lastAngle;
  color c;
  
  void setColor(color colr) {
    c = colr;
  }
  
  String getName() {
    return name;
  }
  
  float getValue() {
    return value;
  }
  
  Arc (float x, float y, float d, float v, String n, color defaultColor) {
    xpos = x;
    ypos = y;
    diameter = d;
    value = v;
    name = n;
    c = defaultColor;
  }
  
  float drawArc(float totalSum, float lastRadian) {
    fill(c);
    float radians = ((float)value/ (float)totalSum)* 2 * 3.14159265358979323;
    arc(xpos, ypos, diameter, diameter, lastRadian, lastRadian + radians);   
    firstAngle = lastRadian;
    lastAngle = lastRadian + radians;
    
    return radians;
  }
  
  boolean mouseOnArc() {
    if(showDonut){
      if (((sq(mouseX - xpos) + sq(mouseY - ypos)) <= sq(diameter/2.0))
          && ((sq(mouseX - xpos) + sq(mouseY - ypos)) > sq(min(.2*width, .2*height)/2.0))) {
        float angle = atan2(mouseY - ypos, mouseX - xpos);
        if (angle < 0) {
          angle += 2*PI;
        }
        if (angle >= firstAngle && angle <= lastAngle) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } else {
      if ((sq(mouseX - xpos) + sq(mouseY - ypos)) <= sq(diameter/2.0)) {
        float angle = atan2(mouseY - ypos, mouseX - xpos);
        println(angle);
        if (angle < 0) {
          angle += 2*PI;
        }
        if (angle >= firstAngle && angle <= lastAngle) {
          return true;
        } else {
          return false;
        }
      }
      return false;  
    }
  }
}
class Arrow{
  PVector wind, location;
  ArrowThread aT;

  Arrow(PVector w){
    wind = w;

    PVector fakeWind = wind.copy();
    fakeWind.y *= -1;
    location = PVector.sub(fakeWind, new PVector()); 
    location.normalize();
    
    aT = new ArrowThread(this, new PVector());
    aT.start();
  }
  
  void SetWind(PVector w){
    wind = w;
  }

  void Draw(){
    pushMatrix();
    //translate(width / 2 + location.x, height / 2 + location.y);
    translate(width / 2 + location.x, height / 2 + location.y);
    noStroke();
    fill(255);
    rotate(atan2(location.x, location.y));
    ellipse(location.x, location.y, 10, 10);
    triangle(location.x - -5, location.y + 0, location.x - 5, location.y + 0, location.x - 0, location.y - 10);
    triangle(0, -width / 2 + width / 64, 10, -width / 2 + width / 64, width / 128, -width / 2);
    popMatrix();
    
    PVector fakeWind = wind.copy();
    fakeWind.y *= -1;
    fakeWind.normalize();
    PVector lerpTo = PVector.sub(fakeWind, new PVector()); 
    aT.lerpTo = lerpTo;
  }
}
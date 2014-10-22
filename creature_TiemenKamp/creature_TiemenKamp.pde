class creature_TiemenKamp extends Creature{
float agitation = 0;
float agitation1 = 0;
float triangleX = 400;
float triangleY = 400;

void setup() {
    size(800, 800);
}

void setAgitation(float newAgitation) {
   agitation = newAgitation;
}

void setAgitation1(float newAgitation1) {
   agitation1 = newAgitation1;
}

void draw(float x, float y) {
    background(0);
    stroke(255);
    noFill();
    
    setAgitation(map(mouseX, 0, width, 0, 1));
    setAgitation1(map(mouseY, 0, width, 0, 1));
    
    float phase = frameCount * 0.025;
    float phaseAddition = map(sin(phase), -1, 1, 0, 0.25);
    for(int i = 0; i < 5; i++){      
      float phase = sin(phase);                   
      float radius = map(phase, -1, 1, 40, 150);  
      float lineWidth = map(phase, -1, 1, 0, 5);
      float r = map(phase, -1, 1, 255, 255);
      float g = map(phase, -1, 1, 255, 255);
      float b = map(phase, -1, 1, 255, 255);
     
      r = lerp(random(255), r, agitation1);
      g = lerp(random(255), g, agitation1);
      b = lerp(random(255), b, agitation1); 
      stroke(r, g, b);

    float lineWidthAddition = random(map(agitation, 0, 1, 0, 15));
    strokeWeight(lineWidth + lineWidthAddition);    
    
    triangle(radius +250, 50, radius +50, radius +300, triangleX, triangleY);
    triangle(radius +50, 400, radius +250, radius +650, triangleX, triangleY);
    triangle(radius +350, 50, radius +600, radius +300, triangleX, triangleY);
    triangle(radius +600, 400, radius +350, radius +650, triangleX, triangleY);
    
    
    if(triangleX > mouseX && triangleX < 780){
      triangleX=triangleX +0.2;
    };
    
    if(triangleX < mouseX && triangleX > 20){
      triangleX=triangleX -0.2;
    };
    
    if(triangleY > mouseY && triangleY < 780) {
      triangleY=triangleY +0.2;
    };
    
    if(triangleY < mouseY && triangleY > 20) {
      triangleY=triangleY -0.2;
    };
    
    
    phase = phase + phaseAddition;
    phaseAddition += 0.5;
  }
}
}

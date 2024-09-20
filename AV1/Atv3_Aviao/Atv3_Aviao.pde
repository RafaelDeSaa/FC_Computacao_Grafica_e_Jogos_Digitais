class Aviao {

  color cor;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  
  Aviao(){
    cor = color(255);
    xpos = width/2;
    ypos = height/2;
    definirDirecaoAleatoria();
  }
  
  void display(){
    rectMode(CENTER);
    fill(cor);
    rect(xpos, ypos, 30, 8);
    rect(xpos+7, ypos, 5, 35);
    rect(xpos-7, ypos, 3, 20);
  }
  
  void definirDirecaoAleatoria() {
    int choice = floor(random(4));
    
    if (choice == 0) {
      xspeed = 1;
      yspeed = 0;
    } else if (choice == 1) {
      xspeed = -1;
      yspeed = 0;
    } else if (choice == 2) {
      xspeed = 0;
      yspeed = 1;
    } else {
      xspeed = 0;
      yspeed = -1;
    }
  }

  void move(){
    xpos += xspeed;
    ypos += yspeed;

    if (xpos > width || xpos < 0) {
      xspeed *= -1; 
    }
    if (ypos > height || ypos < 0) {
      yspeed *= -1; 
    }

    if (random(1) < 0.01) {
      definirDirecaoAleatoria();
    }
  }
}

Aviao aviao;

void setup(){
  size(800, 600);
  aviao = new Aviao();
}

void draw(){
  background(0);
  aviao.display();
  aviao.move();
}

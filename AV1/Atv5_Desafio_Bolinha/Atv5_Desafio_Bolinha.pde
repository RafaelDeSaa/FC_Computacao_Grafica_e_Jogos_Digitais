int vida = 3;
int raioPersonagem = 20;
int xPersonagem, yPersonagem;
int velocidade = 5;


int objetoLargura = 40;
int objetoAltura = 40;
int xObjeto = 100;
int yObjeto = 100;

void setup() {
  size(640, 480);
  xPersonagem = width / 2;
  yPersonagem = height / 2;
}

void draw() {
  background(255);
  
 
  fill(255, 0, 0);
  rect(xObjeto, yObjeto, objetoLargura, objetoAltura);
  
  
  fill(0, 0, 255);
  ellipse(xPersonagem, yPersonagem, raioPersonagem * 2, raioPersonagem * 2);
  
  
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        xPersonagem -= velocidade;
      } else if (keyCode == RIGHT) {
        xPersonagem += velocidade;
      } else if (keyCode == UP) {
        yPersonagem -= velocidade;
      } else if (keyCode == DOWN) {
        yPersonagem += velocidade;
      }
    }
  }
  
 
  if (xPersonagem + raioPersonagem > xObjeto && xPersonagem - raioPersonagem < xObjeto + objetoLargura &&
      yPersonagem + raioPersonagem > yObjeto && yPersonagem - raioPersonagem < yObjeto + objetoAltura) {
    vida--;
    delay(200);
    
    if (vida <= 0) {
      fill(0);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
      noLoop(); 
    }
  }
  
  
  fill(0);
  textSize(16);
  text("Vida: " + vida, 50, 30);
}

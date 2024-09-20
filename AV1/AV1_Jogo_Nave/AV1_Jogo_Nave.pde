int LARGURA_JANELA = 800;
int ALTURA_JANELA = 600;
boolean moveEsquerda = false;
boolean moveDireita = false;
Nave nave;
Inimigo[] inimigos = new Inimigo[3];  

void settings() {
    size(LARGURA_JANELA, ALTURA_JANELA); 
}

void setup() {
    nave = new Nave();  

   
    for (int i = 0; i < inimigos.length; i++) {
        float xPosInimigo = i * 150 + 100;  
        float yPosInimigo = random(-300, 0);  
        inimigos[i] = new Inimigo(xPosInimigo, yPosInimigo);
    }
}

void draw() {
    background(0);  

    
    if (moveEsquerda) {
        nave.moverEsquerda();
    }
    if (moveDireita) {
        nave.moverDireita();
    }

   
    nave.atualizar();
    nave.display();

    
    for (int i = 0; i < inimigos.length; i++) {
        inimigos[i].mover();
        inimigos[i].display();

        
        if (nave.bala.colidiu(inimigos[i])) {
            println("Inimigo destruído!");
            nave.bala.removerProjetil(); 
            inimigos[i].yPos = -inimigos[i].altura;  
        }
    }
}

void keyPressed() {
    if (keyCode == LEFT) {
        moveEsquerda = true;  
    } else if (keyCode == RIGHT) {
        moveDireita = true;  
    } else if (key == ' ') {
        nave.atirar();  
    }
}

void keyReleased() {
    if (keyCode == LEFT) {
        moveEsquerda = false; 
    } else if (keyCode == RIGHT) {
        moveDireita = false;  
    }
}

class Bala {
    float xPos, yPos;
    int largura, altura;
    float ySpeed;
    boolean ativa;

    Bala() {
        this.xPos = -10;
        this.yPos = -10;
        this.largura = 10;
        this.altura = 10;
        this.ySpeed = 5.0;
        this.ativa = false;
    }

    void disparar(float x, float y) {
        if (!ativa) {
            this.xPos = x;
            this.yPos = y;
            this.ativa = true;
        }
    }

    void moverProjetil() {
        if (ativa) {
            this.yPos -= ySpeed;
            if (this.yPos <= 0) {
                removerProjetil();
            }
        }
    }

    void removerProjetil() {
        this.xPos = -10;
        this.yPos = -10;
        this.ativa = false;
    }

    void display() {
        if (ativa) {
            fill(255, 0, 0);  
            ellipse(xPos, yPos, largura, altura);  
        }
    }

    boolean colidiu(Inimigo inimigo) {
        if (ativa) {
            
            float distancia = dist(xPos, yPos, inimigo.xPos + inimigo.largura / 2, inimigo.yPos + inimigo.altura / 2);
            if (distancia < (largura / 2 + inimigo.largura / 2)) {
                return true;
            }
        }
        return false;
    }
}

class Nave {
    float xPos, yPos;
    int largura, altura;
    float xSpeed;
    Bala bala;

    Nave() {
        this.largura = 50;
        this.altura = 50;
        this.xSpeed = 12.0f;
        this.xPos = (LARGURA_JANELA - largura) / 2;
        this.yPos = ALTURA_JANELA - altura;
        this.bala = new Bala();
    }

    void moverEsquerda() {
        if (xPos > 0) {
            xPos -= xSpeed;
        }
    }

    void moverDireita() {
        if (xPos < LARGURA_JANELA - largura) {
            xPos += xSpeed;
        }
    }

    void atirar() {
        if (!bala.ativa) {
            bala.disparar(xPos + largura / 2, yPos);
        }
    }

    void display() {
        fill(255);  
        rect(xPos, yPos, largura, altura); 
        bala.display();  
    }

    void atualizar() {
        bala.moverProjetil(); 
    }
}

class Inimigo {
    float xPos, yPos;
    int largura, altura;
    float ySpeed;

    Inimigo(float x, float y) {
        this.xPos = x;
        this.yPos = y;
        this.largura = 40;
        this.altura = 40;
        this.ySpeed = 2.0f;
    }

    void mover() {
        yPos += ySpeed;  
        if (yPos > ALTURA_JANELA) {
            yPos = -altura;  
        }
    }

    void display() {
        fill(0, 255, 0);  
        rect(xPos, yPos, largura, altura);  
    }
}

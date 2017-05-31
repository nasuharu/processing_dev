import java.util.*; 
ArrayList rs;

int i=0,j=0,k=0,l=0;
int Xt=300,Yt=700;



void setup(){
  size(600,800);
  background(120);
  rs = new ArrayList();
}

void draw() {
  background(99); //背景を白
  Object r;
  for (int i = rs.size()-1; i >= 0; i--) { 
    r = (r) rs.get(i);
    r.move();
    r.display();
    if (r.finished()) {
      // オブジェクト削除
      rs.remove(i);
    }
    
  } 
}

void keyPressed(){
  
  if (key == 'w') {
    i = i+4;
    //background(120);
  }else if(key == 'a'){
    j = j+4;
    //background(120);
  }else if(key == 's'){
    k = k+4;
    //background(120);
  }else if(key == 'd'){
    l = l+4;
    //background(120);
  }
  if(r.enterKeyPressed()){
    pushMatrix();
    rect(Xt-j+l,Yt-i+k,100,50);
    rs.remove();
   popMatrix();
  
  }
  background(120);
  

  delay(8);
  
}
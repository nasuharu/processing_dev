int x[] = new int[10];
int y[] = new int[10];
//int r = 0;
int a,j=0;
int Xt,Yt;
int XX,YY;
int yoko,tate;

void setup(){
  
  Xt=500;
  Yt=1000;     //オブジェクト初期位置
  XX=0;
  YY=0;          //
  yoko=300;
  tate=100;
  
  size(1000,1200);
  background(120);
  
  
}

void draw() {
    
  
  
}

void keyPressed(){
  int ww=0,aa=0,ss=0,dd=0;
  background(120);
  switch(key){
    case 'w'://前
      ww=-4;
      
      pushMatrix();
      object(ww,aa,ss,dd);
      popMatrix();
      display();
      break;
      
    case 'a'://左
      aa=-4;
      
      pushMatrix();
      object(ww,aa,ss,dd);
      popMatrix();
      display();
      break;
      
    case 's'://後
      ss=4;
      
      pushMatrix();
      object(ww,aa,ss,dd);
      popMatrix();
      display();
      break;
      
    case 'd'://右
      dd=4;
      
      pushMatrix();
      object(ww,aa,ss,dd);
      popMatrix();
      display();
      break;
    
    /*case 'r':
      rotate(r);
      paste(ww,aa,ss,dd);
      r++;
      break;*/
      
    case ENTER:
      if(j<10){
        paste(ww,aa,ss,dd,x,y);
        display();
        j++;
      }
      else{}
      display();
      break;
      
    default:
    
  }
  
  
}

void keyReleased(){
  
  pushMatrix();
  translate(0,0,0);
  object(0,0,0,0);
  popMatrix();
  
}
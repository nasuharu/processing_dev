int[] x = new int[10];
int[] y = new int[10];

int a = 0;
int Xt=0,Yt=0;
int XX=150,YY=500;

void setup(){
  size(1000,1200);
  background(120);
}

void draw() {
  for(int i=0;i<=a;i++){
    
    rect(x[a],y[a],100,50);
    println(a);
  }
  
}

void keyPressed(){
  int ww=0,aa=0,ss=0,dd=0;
  background(120);
  switch(key){
    case 'w'://前
      ww=-4;
      
      pushMatrix();
      translate(aa+dd,ww+ss,0);
      object(ww,aa,ss,dd);
      popMatrix();
      
      break;
      
    case 'a'://左
      aa=-4;
      
      pushMatrix();
      translate(aa+dd,ww+ss,0);
      object(ww,aa,ss,dd);
      popMatrix();
      
      break;
      
    case 's'://後
      ss=4;
      
      pushMatrix();
      translate(aa+dd,ww+ss,0);
      object(ww,aa,ss,dd);
      popMatrix();
      
      break;
      
    case 'd'://右
      dd=4;
      
      pushMatrix();
      translate(aa+dd,ww+ss,0);
      object(ww,aa,ss,dd);
      popMatrix();
      
      break;
      
    case ENTER:
    
      paste(ww,aa,ss,dd);
      
      break;
      
    default:
    
  }
  
  
}

void keyReleased(){
  pushMatrix();
  translate(0,0,0);
  object(0,0,0,0);
  popMatrix();
  //Key_released_sign = true;
}


void paste(int ww,int aa,int ss,int dd){
  
  XX=Xt+aa+dd;
  YY=Yt+ww+ss;
  
  x[a]=XX;
  y[a]=YY;
  //pushMatrix();
  //rect(Xt,Yt,100,50);
  //popMatrix();
  a++;
  
}
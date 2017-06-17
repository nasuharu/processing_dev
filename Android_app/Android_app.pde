//sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//android_sensor
import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;

import android.view.MotionEvent;

//各宣言

KetaiGesture gesture;

PImage img_d1;  //画像
boolean tapFlag1 = false;
float ImWsize,ImHsize,orgImWsize,orgImHsize;
float x,y,x1,y1,px,py,V,a,v,sc,m;


void setup(){
  size(displayWidth,displayHeight);
  //background(255);
  x=width/2;
  y=height/2;
  a = 200;
  sc = 100;
  m = 0;
  
  img_d1 = loadImage("door_sample.png");
  ImWsize = img_d1.width;
  ImHsize = img_d1.height;
  orgImWsize = img_d1.width;  //サイズ保存
  orgImHsize = img_d1.height; //サイズ保存
  
  imageMode(CENTER);
  
  
  gesture = new KetaiGesture(this);
  
}

void draw(){
  background(0);
  //image(img_d1,x1,y1,ImWsize,ImHsize);
  
  
  
  //if(tapFlag1 == true){
    
    //V = constrain(v,0,7000);
    //text(V,800,800);
    //a = a-10;
    //V = V-10-a;
    
    //m += -(abs(py-y));
    pushMatrix();
    //sc = mouseY;
    //translate(0,sc);
    
    //スクロール検証
    rect(0,0,600,200);
    rect(0,300,600,200);
    rect(0,600,600,200);
    rect(0,900,600,200);
    rect(0,1200,600,200);
    rect(0,1500,600,200);
    rect(0,1800,600,200);
    rect(0,2100,600,200);
    rect(0,2400,600,200);
    
    popMatrix();
    
  //}
  
  rect(0,0,400,400);
  
}

void mouseDragged(){
  
  
  
}


void onFlick(float x_, float y_, float px_, float py_, float v_){//px_,py_はフリック開始時座標,x_,y_はフリック終了時座標,v_はフリックの速さ
  
  fill(random(255),random(255),random(255));
  //textSize(50);
  v = v_;
  x1 = x_;
  y1 = y_;
  px = px_;
  py = py_;
  
  
  
  
}


void onTap(float x,float y){  //タップしたところの(x座標,y座標)
  tapFlag1 = true;
  //image(img_d1,x,y);  //画像表示
  
}


/**************************************************************************
void onPinch(float x, float y, float d)  //元の比を維持したままサイズ変更
{
  ImWsize = constrain(ImWsize+d, 10, 2000);      //(拘束したい変数,最小値,最大値)
  ImHsize = constrain((orgImHsize*(ImWsize/orgImWsize)), 10, 2000);//最初の縦長さ*(変更後横長さ/最初の横長さ)
}
**************************************************************************/

public boolean surfaceTouchEvent(MotionEvent event){  //必要不可欠
  super.surfaceTouchEvent(event);
  return gesture.surfaceTouchEvent(event);
}
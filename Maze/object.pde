void object(int ww,int aa,int ss,int dd){
  Xt=Xt+aa+dd;
  Yt=Yt+ww+ss;
  translate(aa+dd,ww+ss,0);
  rect(Xt,Yt,yoko,tate);
  
}
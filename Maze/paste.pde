int [] p;
int a = 0;
void paste(int Xt,int Yt,int i,int j,int k,int l){
  Xt=Xt+j+l;
  Yt=Yt+i+k;
  pushMatrix();
  
  rect(Xt,Yt,100,50);
  
  popMatrix();
  a++;
}
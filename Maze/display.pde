void display(){
  for(int i=0;i<a;i++){
    pushMatrix();
    println(a,x[i],y[i]);
    rect(x[i],y[i],yoko,tate);
    popMatrix();
  }
}
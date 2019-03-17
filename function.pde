

void box_trans(int trX,int trY,int trZ,int rotX,int rotY,int rotZ,int sizeX,int sizeY,int sizeZ){
  translate(trX,trY,trZ);
  rotateX(rotX*PI/180);
  rotateY(rotY*PI/180);
  rotateZ(rotZ*PI/180);
  
  box(sizeX,sizeY,sizeZ);
  
  translate(-1*trX,-1*trY,-1*trZ);
  rotateX(-1*rotX);
  rotateY(-1*rotY);
  rotateZ(-1*rotZ);
}

void sphere_trans(int trX,int trY,int trZ,int rotX,int rotY,int rotZ,int r){
  translate(trX,trY,trZ);
  rotateX(rotX*PI/180);
  rotateY(rotY*PI/180);
  rotateZ(rotZ*PI/180);
  
  sphere(r);
  
  translate(-1*trX,-1*trY,-1*trZ);
  rotateX(-1*rotX);
  rotateY(-1*rotY);
  rotateZ(-1*rotZ);
}

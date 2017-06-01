



void setup() {

  size(800, 600, P3D);
  background(100, 10, 50);

background(0, 100, 150);


  frameRate((30));
}




//----------------------------------------------------------------------------

//ball motion
float ball1 =  (random(30));
float ball2 =  (random(30));
float speed1 = (random(30));
float speed2 = (random(30));

int hit= 0;
int miss = 0;

void draw() {

//-------------------------------------------
  float pad= 70;  // size of paddle

  if (ball1 < 0 || ball1 > width) speed1 = -speed1;
  if (ball2 > height) { 
    speed2 = -speed2;

    float area = abs(mouseX - ball1);

    if (area < pad) hit +=1;
    else miss += 1;
  } else speed2 += 1;



  ball1 += speed1;
  ball2 += speed2;
//--------------------------------------------------


  background(100, 10, 50);

  ellipse(ball1, ball2, 20, 20);   //ball


  fill(56, 65, 70);                       
  rect(mouseX-pad, height-10, 2*pad, 30);     //paddle


  fill(255);
  text("Player Goal: " + hit, 20, 50);     //scores   // need to change color of only text
  text("Player Miss: " + miss, 120, 50);

text("Difficuly Level: ", 700, 350 );
text ("1 = Super Easy", 700, 380);
text ("2 = Easy", 700, 410);
text ("3 = Medium", 700, 440);
text ("4 = Hard", 700, 470);
text ("R = Reset Score", 700, 500);
text ("P = Pause Game", 700, 530);

//------------------------------------------------------------------Called Functions
  drawSelfie();
  pad2();

}


void drawSelfie() {

  pushMatrix();                                             //positions portrait in the middle
  translate(100, -0);

  ellipseMode(CENTER);

  noStroke();
  fill(180, 102, 0);
  ellipse(140, 300, 50, 50);
  ellipse(460, 300, 50, 50);
  fill(200, 150, 50);
  ellipse(140, 300, 30, 30);
  ellipse(460, 300, 30, 30);


  //face
  noStroke();
  fill(180, 102, 0);
  ellipse(300, 305, 290, 290);
  strokeWeight(8);
  stroke(255, 225, 190);
  ellipse(300, 305, 290, 290);


  //mouth
  strokeWeight(15);
  stroke(205, 115, 115);
  line(280, 400, 350, 400);




  if (hit > miss) {        //smile                              //smile/frown 

    strokeWeight(21);
    stroke(205, 115, 115);
    bezier(250, 380, 250, 420, 350, 420, 350, 380);
  } else if (miss > hit) {
    
   pushMatrix();                                               //positions frown in the middle
  translate(0, 130);
  
    strokeWeight(21);
    stroke(205, 115, 115);
    bezier(250, 290, 280, 190, 350, 250, 350, 290);
    
    popMatrix();
  }




  //eyes
  noStroke();
  fill (255, random(255), random(255));
  ellipse (240, 260, 60, 60);
  ellipse(360, 260, 60, 60);
  fill(random(200), random(150), 50);
  ellipse(240, 260, 40, 40);
  ellipse(360, 260, 40, 40);
  noStroke();
  fill(0);
  ellipse(240, 260, 20, 20);
  ellipse(360, 260, 20, 20);



  //eyebrows  
  strokeWeight(10);
  stroke(200, 150, 50);
  line(200, 210, 250, 200);
  line(350, 190, 400, 210);



  //nose
  stroke(200, 150, 50);
  noFill();
  triangle(290, 330, 305, 355, 320, 325);


  // Body
  stroke(0);
  fill(204, 102, 0);
  rect(278, 454, 40, 80);

  // arms
  stroke(0);
  
   line(278, 454, 190, 500);                
  
  if(hit > miss){
  pushMatrix();
 
  
  
  for (int i = 500; i < 560; i = i +1){
  translate(width/2, height/2);
  
  line(278, 454, 190, i);                      //left arm up
  rotateZ(radians(i += 1));
  }
  
popMatrix();
}

  line(320, 454, 410, 500);                  //right arm



  // Legs
  stroke(0);
  line(275, 530, 270, 600);
  line(320, 530, 410, 850);


  popMatrix();
}


int hit2 = 0;
int miss2 = 0;


void pad2(){                                          //paddle2


float pad2 =70;


fill(100, 150, 0);
rect(ball1+ speed1-pad2, height-620, 2*pad2, 30);     //paddle2





  if (ball1 < 0 || ball1 > width) speed1 = -speed1;
  if (ball2 > height) { 
    speed2 = -speed2;

   float area2 = abs(pad2 - ball1);

    if (area2 < pad2) hit2 +=1;
    else miss2 += 1;
  } else speed2 += 1;

  ball1 += speed1;
  ball2 += speed2;





  fill(100, 150, 0);
  text("Computer Goal: " + hit2, 500, 50);     //scores   // need to change color of only text
  text("Computer Miss: " + miss2, 630, 50);
  
  
  

}





void keyPressed() {                                // work on keypressed



  if (key == 'p' || key == 'p') {                  //pause game
    frameRate(0);
    println("p just got pressed:"+frameRate);
  } else if (key == 's' || key == 'S') {           //start game
    frameRate(30);
    println("s just got clicked:"+frameRate);
  }else if (key == 'r' || key == 'R'){             //resets score
  
  hit = 0; 
  miss = 0;
  hit2 = 0;
  miss2 = 0;
    
  }
    
    
    
    
    
  //---------------------------------------------------  levels for game
   else if (key == '1' ) {
    frameRate(15);
  } else if (key== '2'){
  frameRate(30);
  } else if (key == '3'){
    frameRate(60);
  } else if( key == '4'){
  frameRate(80);
  }
}

void FLS() {
  //0 to 2
  LowFrontLegSetup();
  // 2 to 3
  Leg8Setup();
  
}

void FL(){
  
  LowFrontLeg();
  
  Leg8();
  
}


// from time 0 to 2

PImage img5;
float x = 0;

void LowFrontLegSetup() {
  img5 = loadImage("LFL.png"); // Load the third image
  img5.resize(111, 25); // Resize img3 to 100 pixels width and 5 pixels height
}

void LowFrontLeg() {
  //int currentTime = second();
  
    // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  a = 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  
  if (floor(elapsedTimeInSeconds) % 6 < 2) {
    
    // Draw imgLF
  pushMatrix(); // Save the current transformation state
  translate(270 + a, 370); // Translate to the rotation point at the right edge for img2 relative to img1
  rotate(radians(90));
  //rotate(rotationAngle / 4); // Rotate img2 (quarter of the rotation angle of img3)
  imageMode(CORNER); // Set image mode to corner
  image(img5, 0, 0); // Draw img2 at the translated rotation point with specified width and height
  popMatrix(); // Restore the previous transformation state
  
  } 
  
  
  
  
  
}







//        From Time 2-3 and 


// Calculate rotation parameters for immage Upper BACK LEG


//float poX = 200, poY = 300; // Current position of the image
PImage img8;



float center8X, center8Y; // Center of the circle
float radius8; // Radius of the circle
float rotationAngle8 = 0; // Initialize rotation angle
float targetRotation8 = radians(45); // Target rotation angle (90 degrees)
float rotationTime8 = 8; // Time in seconds to complete the rotation
float rotationSpeed8 = targetRotation8 / rotationTime8; // Rotation speed in radians per second
float currentRotation8 = radians(270);




void Leg8Setup() {
  img8 = loadImage("LFL.png"); // Load the third image
  img8.resize(100, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  center8X = 200 + 100/sqrt(2);
  center8Y = 400 + 100/sqrt(2);
  radius8 = 50 ; // Calculate radius of the circle
  
  rotationSpeed8 = targetRotation8 / frameRate; // Calculate rotation speed
}

void Leg8() {
  
  
  //int currentTime = second();
    // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  
  // Calculate new position based on rotation
  float newX = center8X + (radius8 * cos(currentRotation8));
  float newY = center8Y + (radius8 * sin(currentRotation8));
  
  // Your function code here
  center8X = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentRotation8 >= radians(270 + 45)){
    currentRotation8 -= radians(45);
  }
  
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 == 2) {
    currentRotation8 += rotationSpeed8; // Rotate clockwise
    // Draw img2 at the new position and rotation
  pushMatrix();
  translate(newX, newY); // Translate to the new position
  rotate(currentRotation8); // Rotate by the current rotation angle
  imageMode(CENTER);
  image(img8, 0, 0); // Draw img2 at the translated position with no rotation
  popMatrix();
  
  } 

  

  
  
}


void LFS() {
  //from 3 to 5
  LowFrontLegSetup35();
  
  
  //from 5 to 6
  Leg1Setup56();
  
}

void LF() {
  
  LowFrontLeg35();
  
   Leg156();
  
}




//Time from 3 to 5

PImage img535;
float x35 = 0;

void LowFrontLegSetup35() {
  img535 = loadImage("LFL.png"); // Load the third image
  img535.resize(111, 25); // Resize img3 to 100 pixels width and 5 pixels height
}

void LowFrontLeg35() {
  //int currentTime = second();
  
  // Calculate elapsed time since the sketch started
  long elapsedTime35 = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds35 = elapsedTime35 / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  float a35 = 100 * sqrt(2) * floor(elapsedTimeInSeconds35 / 3);
  
  if (floor(elapsedTimeInSeconds35) % 6 >= 3 && floor(elapsedTimeInSeconds35) % 6 < 5) {
    
    // Draw imgLF
    pushMatrix(); // Save the current transformation state
    translate(270 + a35, 370); // Translate to the rotation point at the right edge for img2 relative to img1
    rotate(radians(90));
    imageMode(CORNER); // Set image mode to corner
    image(img535, 0, 0); // Draw img2 at the translated rotation point with specified width and height
    popMatrix(); // Restore the previous transformation state
    
  }
}















// TIme from 5 to 6
//      

// Calculate rotation parameters for image Upper BACK LEG

PImage img156;

float center1X56, center1Y56; // Center of the circle
float radius1; // Radius of the circle
float rotationAngle1 = 0; // Initialize rotation angle
float targetRotation1 = radians(45); // Target rotation angle (90 degrees)
float rotationTime1 = 1; // Time in seconds to complete the rotation
float rotationSpeed1 = targetRotation1 / rotationTime1; // Rotation speed in radians per second
float currentRotation1 = radians(270);

void Leg1Setup56() {
  img156 = loadImage("LFL.png"); // Load the third image
  img156.resize(111, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  center1X56 = 200 + 100/sqrt(2);
  center1Y56 = 400 + 100/sqrt(2);
  radius1 = 50; // Calculate radius of the circle
  
  rotationSpeed1 = targetRotation1 / frameRate; // Calculate rotation speed
}

void Leg156() {
  //int currentTime = second();
  // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  // Calculate new position based on rotation
  float newX = center1X56 + (radius1 * cos(currentRotation1));
  float newY = center1Y56 + (radius1 * sin(currentRotation1));
  
  // Your function code here
  center1X56 = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds / 3);
  if (currentRotation1 >= radians(270 + 45)) {
    currentRotation1 -= radians(45);
  }
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 == 5) {
    currentRotation1 += rotationSpeed1; // Rotate clockwise
    // Draw img2 at the new position and rotation
    pushMatrix();
    translate(newX, newY); // Translate to the new position
    rotate(currentRotation1); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img156, 0, 0); // Draw img2 at the translated position with no rotation
    popMatrix();
    
  } 
}

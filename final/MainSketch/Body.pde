// AdditionalFunctions.pde

PImage img1;


// Calculate rotation parameters for Body image  img1


float centerXi1, centerYi1; // Center of the circle
float radiusi1; // Radius of the circle
float rotationAnglei1 = 0; // Initialize rotation angle
float targetRotationi1 = radians(45); // Target rotation angle (90 degrees)
float rotationTimei1 = 8; // Time in seconds to complete the rotation
float rotationSpeedi1 = targetRotationi1 / rotationTimei1; // Rotation speed in radians per second
float currentRotationi1 = radians(225);



void BodySetup() {
  // Your function code here
  
  //parameters of img 1
  img1 = loadImage("body.png"); // Load the first image
  img1.resize(650, 325); // Resize img1 to 200x200 pixels
  
  
  // Calculate center position of the circle
  centerXi1 = 200 + 100/sqrt(2) + 90;
  centerYi1 = 200 + 100/sqrt(2) + 170;
  radiusi1 = 100 ; // Calculate radius of the circle
  
  rotationSpeedi1 = targetRotationi1 / frameRate; // Calculate rotation speed
}



void Body() {
  
  
  
  
  pushMatrix(); // Save the current transformation state
  //translate(poX, poY); // Translate to the rotation point at the left edge for img3 relative to img1
  //rotate(radians(90));
  
  // Set frame rate
  frameRate(60); // Adjust as needed
  
  //int currentTime = second();
  
    // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  // Your function code here
  centerXi1 = 200 + 100/sqrt(2) + 100*sqrt(2) * floor((elapsedTimeInSeconds)/3) + 90;
  if(currentRotationi1 >= radians(225 + 90)){
    currentRotationi1 -= radians(90);
  }
  
  
  
   // Determine rotation angle based on elapsed time
  if (elapsedTimeInSeconds % 6 >= 0 && elapsedTimeInSeconds % 6 <= 1) {
    currentRotationi1 += rotationSpeedi1;
  } else if (elapsedTimeInSeconds % 6 >= 1 && elapsedTimeInSeconds % 6 <= 2) {
    currentRotationi1 -= 0;//rotationSpeedi1;
  }else if (elapsedTimeInSeconds % 6 >= 2 && elapsedTimeInSeconds % 6 <= 3) {
    currentRotationi1 += rotationSpeedi1;
  }else if (elapsedTimeInSeconds % 6 >= 3 && elapsedTimeInSeconds % 6 <= 4) {
    currentRotationi1 += rotationSpeedi1;
  } else if (elapsedTimeInSeconds % 6 >= 4 && elapsedTimeInSeconds % 6 <= 5) {
    currentRotationi1 += 0;//rotationSpeedi1;
  }else if (elapsedTimeInSeconds % 6 >= 5 && elapsedTimeInSeconds % 6 <= 6) {
    currentRotationi1 += rotationSpeedi1;
  }
  
  // Calculate new coordinates based on rotation
  //currentRotationi1 = radians(225);
  //currentRotationi1 %= TWO_PI;
  float newX = centerXi1 + (radiusi1 * cos(currentRotationi1));
  float newY = centerYi1 + (radiusi1 * sin(currentRotationi1));
  
  //println("New X: " + newX);
  //println("New Y: " + newY);
  
  // Draw the image at the new coordinates
  imageMode(CENTER);
  image(img1, newX, newY);
  
  popMatrix(); // Restore the previous transformation state
  
  //code of img 1 end
}

PImage toe_leg;       // Variable to hold the original image
PImage cropped_toe_leg;   // Variable to hold the cropped image
PImage rotated_toe_leg;   // Variable to hold the rotated image
PImage finalCrop_toe_leg; // Variable to hold the final cropped image after rotation

void ToeLegSetup() {
  // Your function code here

  // size(1000, 500);            // Set the size of the window
  toe_leg = loadImage("source.png");  // Load the image
  if (toe_leg == null) {
    println("Image not found.");
    exit();  // Exit the program if the image can't be loaded
  }
  
  // Step 1: Crop the image
  cropped_toe_leg = toe_leg.get(340, 300, 90, 90); // Crop the image (x, y, width, height)
  
  cropped_toe_leg.save("cropped.jpg");         // Save the cropped image
  //  Calculate the diagonal length
  float diagonal = sqrt(sq(cropped_toe_leg.width) + sq(cropped_toe_leg.height));
  
  // Step 2: Calculate the angle to rotate (diagonal from top-left to bottom-right becomes vertical)
  float angle = -atan2(cropped_toe_leg.width, cropped_toe_leg.height); // Angle in radians
  
  // Step 3: Create a new PGraphics object to draw the rotated image
  PGraphics pg = createGraphics(cropped_toe_leg.width, cropped_toe_leg.height); // Notice width and height swapped
  
  pg.beginDraw();
  pg.background(255); // Optional: Set a background color
  pg.translate(pg.width / 2, pg.height / 2); // Move origin to the center
  pg.rotate(angle); // Rotate the image by the calculated angle
  pg.imageMode(CENTER);
  pg.image(cropped_toe_leg, 0, 0);
  pg.endDraw();
  
  // Convert PGraphics to PImage
  rotated_toe_leg = pg.get(); 
  
  // Step 4: Crop the rotated image
  // Define the new cropping region
  int cropX = 8; // X coordinate of the crop
  int cropY = 30; // Y coordinate of the crop
  int cropWidth = 100; // Width of the crop
  int cropHeight = (int)diagonal - 80; // Height of the crop
  
  // Ensure the cropping dimensions do not exceed the rotated image size
  cropX = constrain(cropX, 0, rotated_toe_leg.width - cropWidth);
  cropY = constrain(cropY, 0, rotated_toe_leg.height - cropHeight);

  finalCrop_toe_leg = rotated_toe_leg.get(cropX, cropY, cropWidth, cropHeight); // Crop the rotated image
  finalCrop_toe_leg.save("toe.jpg");
  
  // Display the images
  //image(toe_leg, 0, 0);           // Display the original image
  //image(cropped_toe_leg, 800, 300);     // Display the cropped image
  //image(rotated_toe_leg, 600, 300);     // Display the rotated image
  //image(finalCrop_toe_leg, 900, 300); // Display the final cropped image after rotation
}

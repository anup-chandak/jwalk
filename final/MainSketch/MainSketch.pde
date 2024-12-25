import com.hamoid.*;

VideoExport videoExport;

// MainSketch.pde

long startTime;

void setup() {
  size(1300, 700);
  
  
  //body parts images
  UpFrontLegSetup();
  
  UpperRearLegSetup();
  
  LowRearLegSetup();
  
  LowerFrontLegSetup();
  
  ToeLegSetup();
  
  
  
  
  
  BodySetup();
  
  FCS();
  
  LFS();
  
  LRS();
  
  FLS();
  
  LegSetup();
  
  LegSetup56();
  
  URS();
  
  UFS();
  
  RLS();
  
  RUS();
  
 
  
  videoExport = new VideoExport(this, "output.mp4"); // Specify output file
  startTime = millis(); // Record start time
  videoExport.startMovie(); // Begin video recording
  
  
}

void draw() {
  background(255);
  
  FC();
  
  LF();
  
  FL();
  
  UF();
  
  Leg56();
   
   
    Body();
   
  
  LR();
  
  UR();
  
  
  
  RL();
  
  RU();
  
  Leg();
  
 
 
 
 
 
 // Record frames to video
  if (millis() - startTime <= 6000) { // Capture for 6 seconds
    videoExport.saveFrame();
  } else {
    // Stop recording after 6 seconds
    videoExport.endMovie();
    println("Video saved. Exiting sketch.");
    exit();
  }
 
 
 
  
}

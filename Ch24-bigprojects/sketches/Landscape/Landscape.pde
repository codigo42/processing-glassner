void setup() {
   size(600, 400);
   smooth();
   drawPostcard();
}

void drawPostcard() {
   // the sun and sky
   color sunColor = color(255, 255, 255);     // sun color
   color hazeColor = color(180, 180, 192);    // sun halo and sky
   color skyColor = color(30, 40, 70);        // dark part of the sky
   float sunX = random(width*.1, width*.9);   // sun x location
   float sunY = random(height*.1, height*.9); // sun y location
   float sunR = wiggle(25, 3);                // sun radius
   float hazeR = wiggle(30, 5);               // sun halo size
   float cloudIntensity = wiggle(40, 5);      // brightness of clouds

   // snowbank colors
   color snowTopColor = color(145, 150, 160, 255); // top of snowbank
   color snowBodyColor = color(50, 60, 70, 255);   // body of snowbank
   float shadowNoiseStrength = wiggle(20, 2);      // strength of snow shadows

   // Number of snowbanks, and number of trees per bank
   int treesPerLayer = 4;
   int numLayers=3;

   // create the sun and sky, then draw them
   Sky sky = new Sky(sunColor, sunX, sunY, sunR, 
                     hazeColor, hazeR, skyColor, cloudIntensity);
   sky.render();

   // draw each layer: build the trees and render them, then the snowbank
   for (int layerNum=0; layerNum<numLayers; layerNum++) {

      float a = norm(layerNum, 0, numLayers-1);
      float layerHeight = lerp(300, 390, a); // vertical location
      float hillWiggle  = lerp( 10,  20, a); // wiggle vertical extent
      float glowHeight  = lerp( 15,  25, a); // height of glow transition zone
      float layerDepth  = lerp( 70,   0, a); // distance of layer from us
   
      // create the parameters for a tree and draw it
      for (int i=0; i<treesPerLayer; i++) {
         float treex = random(width*.1, width*.9);   // x base of tree
         float treey = layerHeight + (2*hillWiggle); // y base of tree
         float treeh = lerp(40, 180, a);             // height by layer
         treeh +=  wiggle(0, treeh/4.0);             // wiggle it a bit
         float treed = layerDepth;                   // depth
         float puffRadius = lerp(5, 40, a);          // puff size
         puffRadius = random(puffRadius, puffRadius+30);  // let puff grow a lot!
         float trunkWidth = lerp(1, 4, a);           // trunk thickness
         float puffDensity = 3.0;                    // higher numbers = more dots

         // pick basic puff color in red-to-yellow range
         float puffHue = random(0, 130.0);    
         float puffSat = 25;                 
         float puffBrt = 50;                 

         // pick related but brighter highlight color
         float highHue = puffHue + wiggle(0, 50);
         while (highHue >= 360) highHue -= 360;  // make sure 0<= hue <=360
         while (highHue < 0) highHue += 360;   
         float highSat = 36;                         
         float highBrt = 74;                         

         // make trunk color in blue-ish range
         float trunkHue = wiggle(225, 20);  
         float trunkSat = 50;               
         float trunkBrt = 46;               

         colorMode(HSB); ////// ****** SWITCHING TO COLOR HSB MODE ******
            color puffColor      = color( puffHue*.71,  puffSat*2.55,  puffBrt*2.55); 
            color highlightColor = color( highHue*.71,  highSat*2.55,  highBrt*2.55); 
            color trunkColor     = color(trunkHue*.71, trunkSat*2.55, trunkBrt*2.55); 
         colorMode(RGB); ////// ****** RETURNING TO COLOR RGB MODE ******
        
         Tree tree = new Tree(sunX, sunY, hazeColor,
                  treex, treey, treed, treeh, 
                  trunkWidth, trunkColor,
                  puffRadius, puffDensity, puffColor, highlightColor);
         tree.render();
      }

      // draw the snowbank
      Snow snow = new Snow(snowTopColor, snowBodyColor, shadowNoiseStrength, glowHeight,
                          hazeColor, layerHeight, hillWiggle, layerDepth);
      snow.render();
   }   
}


BufferedReader Reader;         // a line-by-line reader
boolean MoreLinesLeft = true;  // are there lines left to read?

void setup() {
   Reader = createReader("file.txt"); // open this file
}

void draw() {
   String line;
   if (MoreLinesLeft) {
      try {                         // try to read a line
         line = Reader.readLine();  // save it in line
      } catch (IOException e) {     // handle IOException errors
         line = null;               // just set line to null
      }
      if (line == null) {           // do we have a valid line?
          MoreLinesLeft = false;    // no, so stop reading
      } else {
          println("next line is "+line); // yes, print it
      }
   }
}

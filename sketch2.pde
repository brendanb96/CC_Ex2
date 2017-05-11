//Interactive GRID

//Grid Default Coordinates (1-4)
int grid1StartX = 51;
int grid1StartY = 40;
int grid2StartX = 151;
int grid2StartY = 40;
int grid3StartX = 251;
int grid3StartY = 40;
int grid4StartX = 51;
int grid4StartY = 160;

//"grid 5" or Center Grid
int centerX = 151;
int centerY = 160;

//Grid Default Coordinates (6-9)
int grid6StartX = 251;
int grid6StartY = 160;
int grid7StartX = 51;
int grid7StartY = 280;
int grid8StartX = 151;
int grid8StartY = 280;
int grid9StartX = 251;
int grid9StartY = 280;

//Interaction Variables
boolean showAllGrids = false;
int lastGrid = 0;
boolean brushON = false;

void setup()
{
  size( 380, 400 );
}

void draw()
{
  //IF "brush" is on, it does not reset the background
  if( !brushON )
  {
    background( 255 );
  }
  strokeWeight(1);
  
  //Controls whether a GRID appears alone
  //or with the rest of them (All)
  //lastGrid refers to last "selected" 
  if( !showAllGrids )
  {
    drawLastGrid( centerX, centerY );
  }
  else
  {
    drawGrid1( grid1StartX, grid1StartY );
    drawGrid2( grid2StartX, grid2StartY );
    drawGrid3( grid3StartX, grid3StartY );
    drawGrid4( grid4StartX, grid4StartY );
    drawGrid6( grid6StartX, grid6StartY );
    drawGrid7( grid7StartX, grid7StartY );
    drawGrid8( grid8StartX, grid8StartY );
    drawGrid9( grid9StartX, grid9StartY );
  }
  
  //Creates a "brush" with last selected grid
  if( brushON )
  {
    strokeWeight(1);
    drawLastGrid( mouseX, mouseY );
  }
}

//KEY commands have various functions... see within for more details
void keyPressed()
{
  //GRID SELECTION Commands
  if( key == '1' )
  {
    drawGrid1( grid1StartX + 100, grid1StartY + 120 );
    lastGrid = 1;
  }
  if( key == '2' )
  {
    drawGrid2( grid2StartX, grid2StartY + 120 );
    lastGrid = 2;
  }
  if( key == '3' )
  {
    drawGrid3( grid3StartX - 100, grid3StartY + 120 );
    lastGrid = 3;
  }
  if( key == '4' )
  {
    drawGrid4( grid4StartX + 100, grid4StartY );
    lastGrid = 4;
  }
  if( key == '5' )
  {
    noFill();
    ellipseMode( CORNER );
    ellipse( centerX, centerY, 250, 250 );
  }
  if( key == '6' )
  {
    drawGrid6( grid6StartX - 100, grid6StartY );
    lastGrid = 6;
  }
  if( key == '7' )
  {
    drawGrid7( grid7StartX + 100, grid7StartY - 120 );
    lastGrid = 7;
  }
  if( key == '8' )
  {
    drawGrid8( grid8StartX, grid8StartY - 120 );
    lastGrid = 8;
  }
  if( key == '9' )
  {
    drawGrid9( grid9StartX - 100, grid9StartY - 120 );
    lastGrid = 9;
  }
  
  //Controls lastGrid Variable and whether
  //a GRID will appear in the center alone or show ALL available grids
  if( key == ' ' )
    {
      background( 255 );
      showAllGrids = !showAllGrids;
    }
  
  //Controls the "brush" variable
  //A "continous brush" brush strokes will be lost when brush is "off"
  if( key == 'b' )
    {
      brushON = !brushON;
    }
}

//Shows what the Brush will be
void mousePressed()
{
  drawLastGrid( mouseX, mouseY );
}

//Function drawing Grid 1 based on a variable starting point
void drawGrid1( int x, int y )
{
  //GRID 1
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    for( int j = 0; j < 80; j += 10 )
    {
      if( ((i/10) % 2 == 1) )
      {
        if( (j/10) % 2 != 0 )
        {
          fill( 0, 0, 0, 10 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }  
      }
      else if( (j/10) % 2 == 0 )
      {
        fill( 5, 100, 50, 100 );
        ellipseMode( CORNER );
        ellipse( x + i, y + j, 10, 10 );
      }
    }
  }
}

//Function drawing Grid 2 based on a variable starting point
void drawGrid2( int x, int y )
{
  //GRID 2
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    for( int j = 0; j < 80; j += 10 )
    {
      if( ((i/10) % 2 == 1) )
      {
        if( mouseX > 250 )
        {
          fill( 0, 0, 0, 10 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
        else
        {
          fill( 20, 255, 100, 50 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
      }
    }
  }
}

//Function drawing Grid 3 based on a variable starting point
void drawGrid3( int x, int y )
{
  //GRID 3
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    int r = 0;
    int g = 50;
    int b = 20;
    for( int j = 0; j < 80; j += 10 )
    { 
      r = mouseX;
      g = mouseY;
      b = mouseX + j;
      
      if( r >= 100 )
      {
        r = i + 100;
      }
      
      if( g >= 155 )
      {
        g = 200;
      }
      
      if( b >= 255 )
      {
        b = j + 100;
      }
      
      fill( r, g, b );
      ellipseMode( CORNER );
      ellipse( x + i, y + j, 10, 10 );
    }
  }
}

//Function drawing Grid 4 based on a variable starting point
void drawGrid4( int x, int y )
{
  //GRID 4 (4A)
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    for( int j = 0; j < 80; j += 10 )
    {
      if( (j / 10) % 2 == 1 )
      {
        if( mouseY > 250 )
        {
          fill( 0, 0, 0, 10 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
        else
        {
          fill( 100, 25, 255, 50 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
      }
    }
  }
}

//NOTE GRID "5" IS SKIPPED; the center is vacant (at start)

//Function drawing Grid 6 based on a variable starting point
void drawGrid6( int x, int y )
{
  //GRID 6 (4B)
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    for( int j = 0; j < 80; j += 10 )
    {
      if( (j / 10) % 2 == 1 )
      {
        if( mouseY > 250 )
        {
          fill( 0, 0, 0, 10 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
        else
        {
          fill( 100, 25, 255, 50 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
      }
    }
  }
}

//Function drawing Grid 7 based on a variable starting point
void drawGrid7( int x, int y )
{
  //GRID 7
  stroke( 0 );
  float rand = random( 255 );
  for( int i = 0; i < 80; i += 10 )
  {
    int newValue1 = i % 40;
    for( int j = 0; j < 80; j += 10 )
    {
      int newValue2 = j % 40;
      if( newValue1 == 0 )
      {
        if( newValue2 == 0 )
        {
          fill( 10, 10, rand, 100 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
        else if( newValue2 >= 20 )
        {
          fill( 100, 200, 100, 100 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
      }
      else if( newValue1 == 30 )
      {
        if( newValue2 >= 20 )
        {
          fill( 200, mouseX, mouseY, 100 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
      }
    }
  }
}

//Function drawing Grid 8 based on a variable starting point
void drawGrid8( int x, int y )
{
  //GRID 8 (4C)
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    for( int j = 0; j < 80; j += 10 )
    {
      if( (j / 10) % 2 == 1 )
      {
        if( mouseY > 250 )
        {
          fill( 0, 0, 0, 10 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
        else
        {
          fill( 100, 25, 255, 50 );
          ellipseMode( CORNER );
          ellipse( x + i, y + j, 10, 10 );
        }
      }
    }
  }
}

//Function drawing Grid 9 based on a variable starting point
void drawGrid9( int x, int y )
{
  //GRID 9
  stroke( 0 );
  for( int i = 0; i < 80; i += 10 )
  {
    for( int j = 0; j < 80; j += 10 )
    {
      if( ((i/10) % 4 == 0) || ((i/10) % 4 == 3) )
      {
         fill( 0, 0, 0, 10 );
         ellipseMode( CORNER );
         ellipse( x + i, y + j, 10, 10 );
      }
    }
  }
}

//Draw last Grid Selected
void drawLastGrid( int x, int y )
{
    if( lastGrid == 0 )
    {
      drawGrid1( x, y );
    }
    if( lastGrid == 1 )
    {
      drawGrid1( x, y );
    }
    if( lastGrid == 2 )
    {
      drawGrid2( x, y );
    }
    if( lastGrid == 3 )
    {
      drawGrid3( x, y );
    }
    if( lastGrid == 4 )
    {
      drawGrid4( x, y );
    }
    if( lastGrid == 6 )
    {
      drawGrid6( x, y );
    }
    if( lastGrid == 7 )
    {
      drawGrid7( x, y );
    }
    if( lastGrid == 8 )
    {
      drawGrid8( x, y );
    }
    if( lastGrid == 9 )
    {
      drawGrid9( x, y );
    }
}
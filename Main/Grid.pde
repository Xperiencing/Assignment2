//The Grid class will be used to keep track of all blocks on the grid. 
class Grid
{
  int rows, cols;
  int [][] grid_data, grid_colour;
  
  Grid(int row, int col)
  {
    rows = row;
    cols = col;
    
    //Initialisng the grid array all to 0 for a fresh game.
    grid_data = new int [rows][cols];
    grid_colour = new int [rows][cols];
    
    for(i = 0; i < rows; i++)
    {
      for(z = 0; z < cols; z++)
      {
        grid_data[i][z] = 0;
        grid_colour[i][z] = 0;
      }
    } 
  }
  
  //This will draw grid for both the start menu and in game.
  void draw_grid()
  {
    i = 0; z = 0;
  
    stroke(255);
  
    //Drawing horizontal lines up until the edge of the screen
    while (i < height) 
    {
      line(border, border + (z * spacing), width - border, border + (z * spacing));
    
      z++;
      i += spacing;
    }
  
    i = 0; z = 0;
  
    //Drawing vertical lines to complete the grid up until the end of the screen.
    while (i < width) 
    {
      line(border + (z * spacing), border, border + (z * spacing), height - border);
    
      z++;
      i += spacing;
    }
  }
  
  void draw_block()
  {
    //source is used to start 
    int source_x, source_y;
    
    for(i = 0; i < rows; i++)
    {
      for(z = 0; z < cols; z++)
      {
        if(grid_data[i][z] == 1)
        {
          //Code for drawing blocks
          source_x = border + (z * spacing);
          source_y = border + (i * spacing);
          
          println("hi");
          
          //Drawing the outer colour of each block.
          stroke(0);
          fill(sec_shape_colour[2]);
          rect(source_x, source_y, spacing, spacing);
        }
      }
    }
  }
}
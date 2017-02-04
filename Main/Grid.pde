//The Grid class will be used to keep track of all blocks on the grid. 
class Grid
{
  int rows, cols;
  int [][] grid_array;
  
  Grid(int row, int col)
  {
    rows = row;
    cols = col;
    
    //Initialisng the grid array all to 0 for a fresh game.
    grid_array = new int [rows][cols];
    
    for(i = 0; i < rows; i++)
    {
      for(z = 0; z < cols; z++)
      {
        grid_array[i][z] = 0;
      }
    } 
  }
  
  //This will draw grid for both the start menu and in game.
  void draw_grid()
  {
    i = 0; z = 0;
  
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
    for(i = 0; i < rows; i++)
    {
      for(z = 0; z < cols; z++)
      {
        if(grid_array[i][z] == 1)
        {
          //Code for drawing block to go here.    
        }
      }
    }
  }
}
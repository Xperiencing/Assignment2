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
        if(grid_data[i][z] > 0)
        {
          //Code for drawing blocks
          source_x = border + (z * spacing);
          source_y = border + (i * spacing);
          
          //Drawing the outer colour of each block.
          stroke(0);
          fill(sec_shape_colour[grid_colour[i][z]]);
          rect(source_x, source_y, spacing, spacing);
          
          //Creating a design on each of the individual blocks.
          line(source_x, source_y, source_x + (spacing * 1/6), source_y + (spacing * 1/6));
          line(source_x + spacing, source_y, source_x + (spacing * 5/6), source_y + (spacing * 1/6));
          line(source_x, source_y + spacing, source_x + (spacing * 1/6), source_y + (spacing * 5/6));
          line(source_x + spacing, source_y + spacing, source_x + (spacing * 5/6), source_y + (spacing * 5/6));
          
          //Adding the centre square to complete the block.
          fill(prim_shape_colour[grid_colour[i][z]]);
          rect(source_x + (spacing * 1/6), source_y + (spacing * 1/6), spacing * 2/3, spacing * 2/3);
        }
      }
    }
  }
  
  //This function clears the grid of all shapes not set.
  void clear_grid()
  {
    for(i = 0; i < rows; i++)
    {
      for(z = 0; z < cols; z++)
      {
        if(grid_data[i][z] == 1)
        {
          grid_data[i][z] = 0;
        } 
      }
    }
  }
  
  //Checking the grid to see if any lines are complete.
  void check_lines()
  { 
    for(i = rows - 1; i >= 0; i--)
    {
      for(z = 0; z < cols - 1; z++)
      {
        if(grid_data[i][z] == grid_data[i][z + 1])
        {
          result = 1;
          
          //This will check if all cols in the row are set
          if(z + 1 == cols - 1)
          {
            //Calling clear line to delete the row.
            clear_line(i);
          }
        }
        
        //Breaking out of the loop to the next row if 
        //any of the blocks are not set.
        else
        {
          result = 0;
          break;  
        }
      }
    }
  }
  
  //This function will delete the current line and move all rows above down.
  void clear_line(int row)
  {
    //Clearing all data from the line before continuing.
    for(i = 0; i < cols; i++)
    {
      grid_data[row][i] = 0;
    }
    
    //Moving each row dow one after the other.
    for(i = row; i > 0; i--)
    {
      for(z = 0; z < cols; z++)
      {
        grid_data[i][z] = grid_data[i - 1][z];
      }
    }
  }
}
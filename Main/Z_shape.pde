class Z_shape extends Shape
{
  int cur_state;
  int [][] block_pos;
  
  Z_shape(color pri_colour, color sec_colour)
  {
    super(pri_colour, sec_colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, -1, 0, 0, 1, 1, 1},
                             {0, 0, 0, 1, 1, 0, 1, -1},
                             {0, 0, 1, 0, 0, -1, -1, -1},
                             {0, 0, 0, -1, -1, 0, -1, 1}
                             };
  }
  
  void plot(int x, int y)
  {
    int temp_x, temp_y;
    int [][] temp_positions = new int[4][2];
    
    //Saving the positions in temporary variables to allow them to be changed.
    temp_x = x;
    temp_y = y;
    
    //These variables are used again as indexes for the arrays.
    i = 0; z = 0;
    
    while(i < 8)
    {
      temp_x += block_pos[cur_state][i];
      temp_y += block_pos[cur_state][i + 1];
      
      if(temp_x < 0)
      {
        //Resetting the while loop and starting again with a different source.
        x -= 1;
        temp_x = x;
        
        i = 0; z = 0;
      }
      else if(temp_y > rows)
      {
        y -= 1;
        temp_y = y;
        
        i = 0; z = 0;
      }
      else
      {
        temp_positions[z][0] = temp_x;
        temp_positions[z][1] = temp_y;
        
        i += 2;
        z += 1;
        
        temp_x = x;
        temp_y = y;
      }
    }
    
    z = 0;
    
    //Finalising the block positions
    for(i = 0; i < 4; i++)
    {
      mainGrid.grid_data[temp_positions[i][z + 1]][temp_positions[i][z]] = 1;     
    }
  }
}
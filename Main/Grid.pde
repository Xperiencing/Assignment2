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
  
  
}
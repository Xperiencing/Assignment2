//The following classes are each unique shapes as part of the game.
class Line_shape extends Shape_base implements Shape
{
  
  Line_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1},
                             {0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1}
                             };
  }
     
}
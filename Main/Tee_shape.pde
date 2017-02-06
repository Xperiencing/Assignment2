class Tee_shape extends Shape_base implements Shape
{
  
  Tee_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 0, -1, -1, 0, 0, 1},
                             {0, 0, -1, 0, 1, 0, 0, 1},
                             {0, 0, 1, 0, 0, 1, 0, -1},
                             {0, 0, 1, 0, -1, 0, 0, -1}
                             };
  }

}
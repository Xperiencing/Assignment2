class Square_shape extends Shape_base implements Shape
{
  
  Square_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, -1, 0, -1, -1, 0, -1}};
  }
  
  void rotate_shape()
  {
    
  }
  
  void reset_rotate()
  {
    
  }
  
  void create_shape()
  {
    fill(255);
    noStroke();
    rect(demo_x, demo_y, spacing * 2, spacing * 2);
  }
}
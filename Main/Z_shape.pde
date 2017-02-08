class Z_shape extends Shape_base implements Shape
{
  
  Z_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, -1, 0, 0, 1, 1, 1},
                             {0, 0, 0, 1, 1, 0, 1, -1},
                             {0, 0, 1, 0, 0, -1, -1, -1},
                             {0, 0, 0, -1, -1, 0, -1, 1}
                             };
  }
  
  void create_shape()
  {
    PShape z;
    
    z = createShape();
    z.beginShape();
    z.fill(255);
    z.noStroke();
    z.vertex(demo_x, demo_y);
    z.vertex(demo_x + spacing, demo_y);
    z.vertex(demo_x + spacing, demo_y - spacing);
    z.vertex(demo_x + (spacing * 3), demo_y - spacing);
    z.vertex(demo_x + (spacing * 3), demo_y);
    z.vertex(demo_x + (spacing * 2), demo_y);
    z.vertex(demo_x + (spacing * 2), demo_y + spacing);
    z.vertex(demo_x, demo_y + spacing);
    z.endShape(CLOSE);
    
    shape(z, 25, 25);
  }
}
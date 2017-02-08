class J_shape extends Shape_base implements Shape
{
  
  J_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, -1, 0, -1, -1},
                             {0, 0, 0, 1, 0, -1, -1, 1},
                             {0, 0, -1, 0, 1, 0, 1, 1},
                             {0, 0, 0, 1, 0, -1, 1, -1}
                             };
  }
  
  void create_shape()
  {
    PShape j;  // The PShape object

    j = createShape();
    j.beginShape();
    j.fill(prim_shape_colour[this.colour]);
    j.stroke(255);
    j.vertex(demo_x, demo_y);
    j.vertex(demo_x + spacing, demo_y);
    j.vertex(demo_x + spacing, demo_y + spacing);
    j.vertex(demo_x + (spacing * 3), demo_y + spacing);
    j.vertex(demo_x + (spacing * 3), demo_y + (spacing * 2));
    j.vertex(demo_x, demo_y + (spacing * 2));
    j.endShape(CLOSE);
    
    shape(j);
  }
}
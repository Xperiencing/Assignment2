class S_shape extends Shape_base implements Shape
{
  
  S_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, 0, 1, -1, 1},
                             {0, 0, 0, -1, 1, 0, 1, 1},
                             {0, 0, -1, 0, 0, -1, 1, -1},
                             {0, 0, 0, 1, -1, 0, -1, -1}
                             };
  }
  
  void create_shape()
  {
    PShape s;
    
    s = createShape();
    s.beginShape();
    s.fill(prim_shape_colour[this.colour]);
    s.stroke(255);
    s.vertex(demo_x, demo_y);
    s.vertex(demo_x + spacing, demo_y);
    s.vertex(demo_x + spacing, demo_y - spacing);
    s.vertex(demo_x + (spacing * 3), demo_y - spacing);
    s.vertex(demo_x + (spacing * 3), demo_y);
    s.vertex(demo_x + (spacing * 2), demo_y);
    s.vertex(demo_x + (spacing * 2), demo_y + spacing);
    s.vertex(demo_x, demo_y + spacing);
    s.endShape(CLOSE);
    
    shape(s);
  }
  
}
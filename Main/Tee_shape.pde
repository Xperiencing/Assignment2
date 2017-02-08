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
  
  void create_shape()
  {
    PShape tee;
    
    tee = createShape();
    tee.beginShape();
    tee.fill(255);
    tee.noStroke();
    tee.vertex(demo_x, demo_y);
    tee.vertex(demo_x + spacing, demo_y);
    tee.vertex(demo_x + spacing, demo_y - spacing);
    tee.vertex(demo_x + (spacing * 2), demo_y - spacing);
    tee.vertex(demo_x + (spacing * 2), demo_y);
    tee.vertex(demo_x + (spacing * 3), demo_y);
    tee.vertex(demo_x + (spacing * 3), demo_y + spacing);
    tee.vertex(demo_x, demo_y + spacing);
    tee.endShape(CLOSE);
    
    shape(tee, 25, 25);
  }

}
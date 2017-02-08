void add_arraylist()
{
  for(i = 0; i < shape_pick.length; i += 2)
  {
    //Creating a test shape for the game.
    if(shape_pick[i] == 0)
    {
      shape_list.add(new Line_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 1)
    {
      shape_list.add(new Square_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 2)
    {
      shape_list.add(new L_shape(shape_pick[i + 1]));
    }                
        
    if(shape_pick[i] == 3)
    {
      shape_list.add(new J_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 4)
    {
      shape_list.add(new Tee_shape(shape_pick[i + 1]));
    }
         
    if(shape_pick[i] == 5)
    {
      shape_list.add(new Z_shape(shape_pick[i + 1]));
    }        
        
    if(shape_pick[i] == 6)
    {
      shape_list.add(new S_shape(shape_pick[i + 1]));
    }        
  } 
  
  x_pos = (int)random(2, cols - 3);
  y_pos = 2;
      
  do
  {
    shape_list.get(0).get_position(x_pos, y_pos);
    shape_list.get(0).check_x();
            
  }while(result != 0);
          
  shape_list.get(0).plot(1);    
}

//This will add a new shape onto the queue
void create_shape()
{
  int [] temp_array =  new int [shape_pick.length];
  for(i = 2, z = 0; i < 8; i += 2, z += 2)
  {
    temp_array[z] = shape_pick[i];
    temp_array[z + 1] = shape_pick[i + 1];
  }
  
  z = 6;
  
  temp_array[z] = int(random(0, 7));
  temp_array[z + 1] = int(random(0,6));
  
  shape_pick = temp_array;
  
  remove_arraylist();
  add_arraylist();
  
  score += score_shape[difficulty];
  
  if(score > highscore)
  {
    highscore = score;
  }
}

void remove_arraylist()
{ 
  for(i = (shape_list.size() - 1); i >= 0; i--)
  {
    shape_list.remove(i);
  }
}

void next_shapes()
{
  //Setting the font to Ariel and setting text parameters.
  textFont(normal);
  textSize(18);
  textAlign(LEFT);
  fill(255);
        
  //Setting x and y positions.
  demo_x = width/2;
  demo_y = height * 1/5;;
       
  text("NEXT SHAPES", demo_x - 15, demo_y - 10);
        
  for(i = 1; i < shape_list.size(); i++)
  {
    demo_y = (height * i/4);
    shape_list.get(i).create_shape();
  }
}

//This will print on the right hand side of the screen the current scores.
void scores()
{
  fill(255);
  
  //Setting the positions of the text.
  demo_x = width * 4/5;
  demo_y = height * 1/3;
  
  textAlign(CENTER);
  text("Highscore:", demo_x, demo_y);
  text(int(highscore), demo_x, demo_y + 20);
  
  demo_y = height * 2/3;
  
  text("Current score:", demo_x, demo_y);
  text(int(score), demo_x, demo_y + 20);
  
}
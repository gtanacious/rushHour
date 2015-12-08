public class Particles
{
  public boolean isRemovable;
  
  private float X;
  private float Y;
  private PVector myVector;
  private boolean isFireWorkParticle;
  private boolean willDraw;
  private int myColor;
  private int alpha;
  private int maxHeight;
  private ArrayList<Particles> smallerParticles;

  public Particles(int initX, int initY, float xVel, float yVel, boolean isFireWork)
  {
    X = initX;
    Y = initY;
    myVector = new PVector(xVel, yVel);
    isFireWorkParticle = isFireWork;
    willDraw = true;
    isRemovable = false;

    if (isFireWorkParticle)
    {
      maxHeight = (int)random(100, 300);
      myColor = color(random(0, 255), random(0, 255), random(0, 255));
      smallerParticles = new ArrayList<Particles>();
    }
    else
    {
      alpha = 255 + (int)random(-100, 100);
    }
  }

  public void updateParticle()
  {
    if (willDraw && isFireWorkParticle && Y < maxHeight)
    {
      //spawn a bunch of small ones.
      willDraw = false;
      for (int i = 0; i < (int)random(175, 275); i++)
      {
        float temp = random(0, TWO_PI);
        smallerParticles.add(new Particles((int)X, (int)Y, cos(temp)*random(0.7, 3), sin(temp)*random(0.2, 3), false));
        smallerParticles.get(i).setColor(myColor);
      }
    } else if (!willDraw && isFireWorkParticle)
    {
      
      if(!smallerParticles.isEmpty())
      {
        for (Particles g : smallerParticles)
        {
          g.updateParticle();
          g.drawParticle();
          g.setAlpha(g.getAlpha()-1);
          g.changeYVector(0.015);
          g.changeXVector(-0.01);
        }
        
        for(int i = 0; i < smallerParticles.size(); i++)
        {
           if(smallerParticles.get(i).getAlpha() < 0){
              smallerParticles.remove(i);
              i--;
           }
        }
      }
      else
      {
        isRemovable = true;
      }
    }

    if (willDraw)
    {
      X += myVector.x;
      Y += myVector.y;
    }
  }

  public void drawParticle()
  {
    if (willDraw && isFireWorkParticle)
    {
      fill(myColor);
      noStroke();
      ellipse(X, Y, 7, 10);
    } else if(willDraw)
    {   
      fill(color(myColor, alpha));
      noStroke();
      float randSize = random(-4, 3-alpha/100);
      ellipse(X, Y, 4+randSize, 4+randSize);
    }
  }

  public void setColor(int col)
  {
    myColor = col;
  }

  public void setAlpha(int val)
  {
    this.alpha = val;
  }

  public int getAlpha()
  {
    return this.alpha;
  }
  
  public void changeYVector(float amnt)
  {
     myVector.y += amnt;
  }
  
  public void changeXVector(float amnt)
  {
      if(myVector.x > 0)
        myVector.x += amnt;
      else
        myVector.x -= amnt;
  }
}
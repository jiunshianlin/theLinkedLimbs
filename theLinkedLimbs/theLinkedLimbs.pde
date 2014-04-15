/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7305*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
  static final int MAX_NUM_PARTICLES = 2048;
  static final int MAX_NUM_SPRINGS = 2048;
  Particle[] particles = new Particle[MAX_NUM_PARTICLES];
  Spring[] springs = new Spring[MAX_NUM_SPRINGS];

  static final double GRAVITY = .2;
  static final double BOUNCE_DAMPENING = 0.02;

  static final double SPRING_FORCE = 0.04;
  static final double RESISTANCE = .09;

  private int numberOfInstances = 7;

  void setup() {

    size(800, 600);

    Particle startParticle = new Particle(width / 2, height / 2, 2);

    for (int i = 0; i < numberOfInstances; i++) {
      Particle endParticle = new Particle(width / 2, height / 2, 2);
      particles[i] = endParticle;
      springs[i] = new Spring(startParticle, endParticle);

      startParticle = endParticle;
    }

    smooth();

    strokeWeight(2.5f);
    stroke(255);
    noFill();
  }

  public void draw() {
    springs[0].startParticle.posX = mouseX;
    springs[0].startParticle.posY = mouseY;
    background(0);

    update();

    noFill();
    beginShape();
    vertex(mouseX, mouseY);
    for (int i = 0; i < numberOfInstances; i++) {
      Particle p = particles[i];
      curveVertex((float) p.posX, (float) p.posY);
    }
    curveVertex((float) particles[numberOfInstances - 1].posX,
        (float) particles[numberOfInstances - 1].posY);
    endShape();

    fill(255);
    ellipse((float) springs[numberOfInstances - 1].endParticle.posX,
        (float) springs[numberOfInstances - 1].endParticle.posY, 5, 5);

  }

  private void update() {
    for (int i = 0; i < numberOfInstances; i++) {
      springs[i].update();
    }
    for (int i = 0; i < numberOfInstances; i++) {
      particles[i].update();
      for (int j = i; j < numberOfInstances; j++) {
        // particles[i].bounce(particles[j]);
      }
    }

    Particle p = springs[0].startParticle;
    p.posX = mouseX;
    p.posY = mouseY;
  }

  
 

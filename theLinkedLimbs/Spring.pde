 class Spring {

    Particle startParticle;
    Particle endParticle;

    public Spring(Particle start, Particle end) {
      startParticle = start;
      endParticle = end;
    }

    public void update() {
      applySpringForce();
    }

    private void applySpringForce() {
      startParticle.vX += (endParticle.posX - startParticle.posX)
          * SPRING_FORCE;
      startParticle.vY += (endParticle.posY - startParticle.posY)
          * SPRING_FORCE;
      endParticle.vX += (startParticle.posX - endParticle.posX)
          * SPRING_FORCE;
      endParticle.vY += (startParticle.posY - endParticle.posY)
          * SPRING_FORCE;
    }
  }

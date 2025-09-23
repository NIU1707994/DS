public class Universe {
    private   int numBodies;             // number of bodies
    private Body[] bodies;              // array of n bodies
    private double radius;

    // read universe from standard input
    public Universe(Body[] bodies, double radius)
    {
        numBodies = bodies.length;
        this.bodies = bodies;
        this.radius = radius;
    }

    /*public void update(double dt)
    {
        Vector[] forces = new Vector[numBodies];
        for (int i = 0; i<numBodies; i++)
        {
            forces[i] = new Vector(new double[2]);
        }
        for (int i=0; i<numBodies; i++) {
            for (int j = 0; j <numBodies; j++)
            {
                if (i != j)
                {
                    forces[i] = forces[i].plus(bodies[i].forceFrom(bodies[j]));
                }
            }
        }

        for (int i=0; i<numBodies; i++)
        {
            bodies[i].move(forces[i], dt);
        }
    } */

    public Vector getBodyPosition(int i)
    {
        return bodies[i].getPosition();
    }

    public int getNumBodies() {
        return numBodies;
    }

    public double getRadius() {
        return radius;
    }

    public Vector computeForceOn(int i) {
        Vector forces = new Vector(new double[2]);

        for (int j = 0; j <numBodies; j++)
        {
            if (i != j)
            {
                forces= forces.plus(bodies[i].forceFrom(bodies[j]));
            }
        }

        return forces;
    }

    public double getBodyMass(int i) {

        return bodies[i].getMass();
    }

    public Vector getBodyVelocity(int i) {
        return bodies[i].getVelocity();
    }

    public void setBodyPosition(int i, Vector newPosition) {
        bodies[i].setPosition(newPosition);
    }

    public void setBodyVelocity(int i, Vector newVelocity) {
        bodies[i].setVelocity(newVelocity);
    }

    public void setBodyAcceleration(int i, Vector a) {
        bodies[i].setAcceleration(a);
    }

    public Vector getBodyAcceleration(int i) {
        return bodies[i].getAcceleration();
    }
}

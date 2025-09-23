public class LeapFrogIntegrator extends Integrator {
    public LeapFrogIntegrator (double dt)
    {
        super(dt);
    }

    @Override
    public void move(Universe universe) {
        int numBodies = universe.getNumBodies();

        for (int i = 0; i < numBodies; i++) {
            Vector a = universe.computeForceOn(i).scale(1.0/ universe.getBodyMass(i));
            Vector x = universe.getBodyPosition(i);
            Vector v = universe.getBodyVelocity(i);
            Vector xNew = (x.plus(v.scale(timeStep))).plus((a.scale(timeStep*timeStep)).scale(0.5));
            universe.setBodyPosition(i, xNew);
            universe.setBodyAcceleration(i,a);
        }

        for (int i = 0; i < numBodies; i++) {
            Vector aNew = universe.computeForceOn(i).scale(1.0/universe.getBodyMass(i));

            Vector v = universe.getBodyVelocity(i);
            Vector vNew = v.plus((universe.getBodyAcceleration(i).plus(aNew)).scale(0.5).scale(timeStep));

            universe.setBodyVelocity(i, vNew);
            universe.setBodyAcceleration(i, aNew);
        }
    }
}

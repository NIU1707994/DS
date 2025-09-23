public abstract class Integrator {
    protected double timeStep;

    public Integrator (double dt)
    {
        timeStep = dt;
    }

    public abstract void move(Universe universe);
}

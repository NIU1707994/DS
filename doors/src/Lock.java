public class Lock extends CodeHandler {
  public Lock(CodeHandler nextHandler) {
    super(nextHandler);
  }

  @Override
  protected void handleCode(String code, Door door) {
    if (door.getNumTrials() == 3) {
      door.lock();
      System.out.println("Door has been locked");
    }
    super.handleCode(code, door);
  }
}

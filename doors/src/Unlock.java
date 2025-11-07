public class Unlock extends CodeHandler {
  protected String codeUnlock;

  public Unlock(String code, CodeHandler nextHandler) {
    super(nextHandler);
    this.codeUnlock = code;
  }
  protected void handleCode(String code, Door door) {

    if (door.isLocked()) {
      if (code.equals(codeUnlock)) {
        door.resetState();
        System.out.println("Unlocked!");
      }
    } else {
      super.handleCode(code, door);
    }
  }
}

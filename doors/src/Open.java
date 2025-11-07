public class Open extends CodeHandler {
  private String codeOpen;

  public Open(String code,CodeHandler nextHandler) {
    super(nextHandler);
    this.codeOpen = code;
  }

  @Override
  protected void handleCode(String code, Door door) {
    System.out.println("Handle Open");
    if(!door.isLocked()) {
      if (code.equals(codeOpen)) {
        door.resetState();
        door.open();
      } else  {
        door.incrementNumTrials();
        System.out.println(door.getNumTrials() + " trials");
        super.handleCode(code, door);
      }
    } else  {
      super.handleCode(code, door);
    }
  };
}

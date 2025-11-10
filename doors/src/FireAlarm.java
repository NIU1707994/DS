public class FireAlarm extends CodeHandler {
  private String codeFireAlarm;

  public FireAlarm(String code, CodeHandler nextHandler) {
    super(nextHandler);
    this.codeFireAlarm = code;
  }

  @Override
  protected void handleCode(String code, Door door) {
    if (!door.isLocked()) {
      if (code.equals(codeFireAlarm)) {
        door.open();
        fireAlarm();
      } else {
        super.handleCode(code, door);
      }
    }
    else {
      super.handleCode(code, door);
    }
  }

  private void fireAlarm() {
    System.out.println("Alarm Fired");
  }
}

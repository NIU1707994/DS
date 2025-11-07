public abstract class CodeHandler {
  protected CodeHandler nextHandler;
  public CodeHandler(CodeHandler nextHandler) {
    this.nextHandler = nextHandler;
  }
  protected void handleCode(String code, Door door) {
    if (this.nextHandler != null) {
      this.nextHandler.handleCode(code, door);
    } else {
      System.out.println("End of the chain");
    }
  };
}

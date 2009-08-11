// Test.as
//                           wookay.noh at gmail.com

package {
  import flash.display.Sprite;
  import flash.text.TextField;
  import cmodule.unittest.CLibInit;
  public class Test extends Sprite {
    private var textField:TextField;
    private var unittest:Object;

    private function assert_equal(expected:int, got:int):void {
      textField.replaceText(textField.length, textField.length,
        unittest.assert_equal(expected, got));
    }

    public function Test() {
      textField = new TextField();
      textField.width = 100;
      textField.height = 100;
      textField.multiline = true;
      addChild(textField);

      var loader:CLibInit = new CLibInit;
      unittest = loader.init();

      assert_equal(1, 1);
      assert_equal(3, 1+2);

    }
  }
}

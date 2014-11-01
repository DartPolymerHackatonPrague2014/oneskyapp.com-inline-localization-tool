import "dart:html";
import "package:polymer/polymer.dart";

@CustomTag('translation-box')
class TranslationBoxElement extends PolymerElement {
  @published String messsage_key = null;
  @published String default_lang = null;
  @observable String translation = "initial translation";
  
  TranslationBoxElement.created() : super.created() {
  }
  
  void submitTranslation(Event event, var detail, Node target) {
    print(translation);
  }
}

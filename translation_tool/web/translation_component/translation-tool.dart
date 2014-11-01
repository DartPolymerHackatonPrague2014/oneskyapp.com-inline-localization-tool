import 'dart:html';
import 'package:polymer/polymer.dart';


@CustomTag('translation-tool')
class TranslationToolElement extends PolymerElement {
  
  @observable bool checked = false;

  TranslationToolElement.created() : super.created();

  void checkedChanged(bool oldValue, bool newValue) {
    var localizedElements = document.querySelectorAll("*[localization_key]");
    if (newValue) {
      localizedElements.classes.add('highlight');
    } else {
      localizedElements.classes.remove('highlight');
    }

  
    for (Element localizedElement in localizedElements) {
      HtmlElement dialog = new Element.tag("paper-dialog");

      Element box = new Element.tag("translation-box");
      box.attributes = {
        'messsage_key': localizedElement.attributes['localization_key'],
        'default_lang': 'cs',
        'translations': '{"cs": "Ahoj", "en": "Hello"}'
      };
      dialog.nodes.add(box);
      
      
      HtmlElement submit = new Element.tag("paper-button");
      submit.attributes = {
        'label': 'Submit',
        'affirmative': 'true',
        'autofocus': 'true',
        'transition': 'paper-dialog-transition-center'
      };
      dialog.nodes.add(submit);
      
      localizedElement.nodes.add(dialog);
      
      
      localizedElement.onClick.listen((MouseEvent event) {
        dialog.toggle();
      });
    }
  }

}

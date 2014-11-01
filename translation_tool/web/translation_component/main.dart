import "dart:html";
import 'package:polymer/polymer.dart';

main() {
  initPolymer().run(() {
    // Code that doesn't need to wait.
    Polymer.onReady.then((_) {
      // Code that executes after elements have been upgraded.
      
      var test = document.querySelectorAll('div[localization_key]');
      
      for (Element el in test) {
        HtmlElement dialog = new Element.tag("paper-dialog");

        Element box = new Element.tag("translation-box");
        box.attributes = {
          'messsage_key': el.attributes['localization_key'],
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
        
        el.nodes.add(dialog);
        
        
        el.onClick.listen((MouseEvent event) {
          /*
          Element box = new Element.tag("translation-box");
          box.attributes = {
            'messsage_key': el.attributes['localization_key'],
            'default_lang': 'cs',
            'translations': '{"cs": "Ahoj", "en": "Hello"}'
          };
          el.parent.nodes.add(box);
          */
          dialog.toggle();
          //el.attributes['translation_box_visible'] = "true";
        });
      }
    });
  });
}
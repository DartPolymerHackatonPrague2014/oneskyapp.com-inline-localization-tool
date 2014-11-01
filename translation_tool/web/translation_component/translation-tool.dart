import 'dart:html';
import 'package:polymer/polymer.dart';
import 'oneskyapp_api_client.dart';
import 'dart:convert';


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

    OneSkyAppApiClient apiClient = new OneSkyAppApiClient();
  
    for (Element localizedElement in localizedElements) {
      HtmlElement dialog = new Element.tag("paper-dialog");

      Element box = new Element.tag("translation-box");
      String messsage_key = localizedElement.attributes['localization_key'];
      Localization localization = apiClient.getLocalization(messsage_key);
      String localizationJSON = "";
      if (localization != null) {
        localizationJSON = JSON.encode(localization.toMap());
      }
      box.attributes = {
        'messsage_key': messsage_key,
        'default_lang': 'cs',
        'translations': localizationJSON
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

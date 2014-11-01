import "dart:html";
import 'dart:convert';
import "package:polymer/polymer.dart";

@CustomTag('translation-box')
class TranslationBoxElement extends PolymerElement {
  @published String messsage_key;
  @published String default_lang;
  @observable String translation;
  @published String translations;
  
  @observable List languages;
  @observable String selectedLanguage;
  Map translationsMap;
    
  TranslationBoxElement.created() : super.created() {
  }
  
  void attached() {
    super.attached();
    
    translationsMap = JSON.decode(translations);
    
    languages = new List.from(translationsMap.keys);
    selectedLanguage = default_lang;
  }

  /*
  void submitTranslation(Event event, var detail, Node target) {
    print(translation);
  }
  */
  
  void selectedLanguageChanged(oldValue, newValue) {
    if (oldValue != null) {
      translationsMap[oldValue] = translation;
      translations = JSON.encode(translationsMap);
    }
    translation = translationsMap[newValue];
  }
  
}

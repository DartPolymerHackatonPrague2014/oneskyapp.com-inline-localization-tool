library oneskyapp_api_client;

class OneSkyAppApiClient {
  
  Map localizations = new Map();
  
  OneSkyAppApiClient() {
     // mock data
     localizations['WelcomeMsg'] = new Localization('WelcomeMsg', { 
        'cs' : 'Webové komponenty znamenají novou éru webového vývoje....', 
        'en' : 'Web Components usher in a new era of web development based on encapsulated and interoperable custom elements that extend HTML itself. Built atop these new standards, Polymer makes it easier and faster to create anything from a button to a complete application across desktop, mobile, and beyond.' 
      });
  }
    
  Localization getLocalization(String localizationKey) {
      return localizations[localizationKey];
  }
  
  void setLocalization(Localization localization) {
      localizations[localization.localizationKey] = localization;
  }
  
}

/// [Localization] represents all localizations of some [localizationKey]
class Localization {
  
  final String localizationKey;
  Map localizedTexts = new Map();
  
  Localization(this.localizationKey, this.localizedTexts);
  
  String forLanguage(String language) {    
    return localizedTexts[language];    
  }
  
  bool hasLanguage(String language) {
    return localizedTexts.containsKey(language); 
  }
  
  Map toMap() {
    return localizedTexts;
  }
  
}
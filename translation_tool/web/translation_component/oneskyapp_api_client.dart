library oneskyapp_api_client;

class OneSkyAppApiClient {
  
  Map localizations = new Map();
  
  OneSkyAppApiClient() {
     // mock data
     localizations['CustomElements'] = new Localization('CustomElements', { 
        'cs' : 'Vlastní elementy', 
        'en' : 'Custom Elements' 
      });
     localizations['ShowdowDOM'] = new Localization('ShowdowDOM', { 
        'cs' : 'Stínový DOM', 
        'en' : 'Showdow DOM' 
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
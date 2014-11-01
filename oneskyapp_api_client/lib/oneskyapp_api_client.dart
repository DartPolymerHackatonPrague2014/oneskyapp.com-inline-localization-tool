library oneskyapp_api_client;

import 'dart:html';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'src/project_group.dart';

class OneSkyAppApiClient {
  
  //final String apiUrl = "http://www.corsproxy.com/platform.api.onesky.io/1";
  final String apiUrl = 'https://jsonp.nodejitsu.com/?url=${Uri.encodeComponent("http://platform.api.onesky.io/1")}';
  final String apiKey;
  final String apiSecret;
  
  OneSkyAppApiClient({this.apiKey, this.apiSecret}) {
    
  }  
    
  Localization getLocalization(String localizationKey) {
  }
  
  void setLocalization(Localization localization) {
    
  }
  
  List<ProjectGroup> getProjectGroups() {
    
      var returnedJson = apiCall('/project-groups').then((httpRequest) {
        var jsonText = httpRequest.responseText;
        
        print(jsonText);
        
        var result = new JsonDecoder().convert(jsonText);
        var projectGroupName = result['data'][0]['name'];
        print('projectGroupName: ${projectGroupName}');
        
      }).catchError((error) {
        
        print("Errorrrr: ${error}");
          
      })  ;
    
  }
  
  Future<HttpRequest> apiCall(String call) {
    
    return HttpRequest.request(
                  apiUrl + Uri.encodeComponent(call + '?' + authParams()), 
                  method: 'GET');
    
  }
  
  String authParams() {
  
      String timeStamp = /* Unix Time (which is in seconds) */ (new DateTime.now().millisecondsSinceEpoch / 1000).toString();
      String devHash =  md5(timeStamp + apiSecret);
    
      return 'timestamp=${timeStamp}&' +
             'dev_hash=${devHash}&' +
             'api_key=${apiKey}';
    
  }
  
  String md5(String text) {
     //Quick MD5 of text
     var hash = CryptoUtils.bytesToHex((new MD5()..add(text.codeUnits)).close());
     return hash;   
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
  
}
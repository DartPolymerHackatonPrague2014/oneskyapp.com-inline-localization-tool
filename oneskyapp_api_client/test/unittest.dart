import 'package:unittest/unittest.dart';
import 'package:oneskyapp_api_client/oneskyapp_api_client.dart';

void main() {
  test('test pass', () => expect(true, isTrue, reason: "Proste musi"));
  
  test('mapa', () {
    
    var mapa = new Map();
    mapa['klic1'] = 'hodnota1';
    
    expect(mapa['klic1'], equals('hodnota1'));
    
  });

  test('Localization#forLanguage is works as expected', () {

//        var url = 'https://platform.api.onesky.io/1/project-groups';
    // using cors proxy as openskyapp.com api doesn't support it directly and this is client (browser) side lib
//    var url = 'http://www.corsproxy.com/platform.api.onesky.io/1/project-groups';

    var oneskyapp = new OneSkyAppApiClient();
    
    var localizedTexts = { 
              'cs' : 'ceska lokalizace', 
              'de' : 'alles gute'             
    };
  
    Localization localization = new Localization('my.localization.label', localizedTexts);
    
    oneskyapp.setLocalization(localization);
    
    expect(localization.forLanguage('cs'), equalsIgnoringCase('ceska lokalizace'));

  });
  
  test('what we put to oneskyapp client is what we get', () {
    
    var oneskyapp = new OneSkyAppApiClient();
       
       var localizedTexts = { 
                 'cs' : 'ceska lokalizace', 
                 'de' : 'alles gute'             
       };
     
       Localization localization = new Localization('my.localization.label', localizedTexts);
       
       oneskyapp.setLocalization(localization);
       
       expect(localization, equals(oneskyapp.getLocalization('my.localization.label')));
    
  });
}



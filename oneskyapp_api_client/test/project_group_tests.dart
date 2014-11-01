import 'package:unittest/unittest.dart';
import 'package:oneskyapp_api_client/oneskyapp_api_client.dart';

void main() {
  
  test('getProjectGroup should return a projectGroup', () {
       
     var oneskyapp = new OneSkyAppApiClient(apiKey: 'w2d6prnzwdMzWgQo25zNcdCwh6AkxUGT ', apiSecret: 'u5HQKxoqjfZndSDrCWolUhOZueDdcAuw');
     
     List<ProjectGroup> projectGroups = oneskyapp.getProjectGroups();
     
     expect(projectGroups, hasLength(1));
     
   });
  
}
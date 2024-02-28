@isTest
public class GetRandomSalesRepTest {
	
    @isTest
    static void testGetRandomNumber(){
        List<Territory__c> territories = new List<Territory__c>();
        for(Integer i = 0; i < 5; i++){
            Territory__c territory = new Territory__C(Name='Territory ' + i);
            territories.add(territory);
        }
        insert territories;
        
        Test.startTest();
        List<List<Territory__c>> inputTerritories = new List<List<Territory__c>>{ territories };
        List<Territory__c> results = GetRandomSalesRep.getRandomNumber(inputTerritories);
        Test.stopTest();
        
        System.assertEquals(1, results.size());
        System.assert(territories.contains(results[0]));
    }
}
public class GetRandomSalesRep {
    @InvocableMethod
    public static List<Territory__c> getRandomNumber(List<List<Territory__c>> territories){
        List<Territory__c> results = new List<Territory__c>();
       	Integer randomNumber = (Integer)Math.floor(Math.random() * territories[0].size());
        results.add(territories[0][randomNumber]);
    	return results;
    }
}
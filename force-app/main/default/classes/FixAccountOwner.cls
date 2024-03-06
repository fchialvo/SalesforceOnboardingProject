public class FixAccountOwner {
	@InvocableMethod
    public static List<Account> fixOwner(List<Account> accts){
        String ZipCode = accts[0].BillingPostalCode;
        System.debug(accts[0].OwnerId);
        
        List<Territory__c> territories = [SELECT OwnerId, Name FROM Territory__c WHERE Name =:ZipCode];
       	Map<Id, List<Territory__c>> relatedSalesReps = new Map<Id, List<Territory__c>>();
        
        for (Territory__c salesRep : territories)
        {
            if (!relatedSalesReps.containsKey(salesRep.OwnerId))
                relatedSalesReps.put(salesRep.OwnerId, new List<Territory__c>());
            relatedSalesReps.get(salesRep.OwnerId).add(salesRep);
        }	
        
        if(!relatedSalesReps.containsKey(accts[0].OwnerId)){
            List<List<Territory__c>> newList = new List<List<Territory__c>>();
            newList.add(territories);
            List<Territory__c> randomSalesRep = getRandomSalesRep.getRandomNumber(newList);
            accts[0].OwnerId = randomSalesRep[0].OwnerId;
             System.debug(accts[0].OwnerId);
        }
        return accts;
    }
}
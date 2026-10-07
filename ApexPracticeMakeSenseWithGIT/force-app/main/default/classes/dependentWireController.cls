public with sharing class dependentWireController {
   
   @AuraEnabled (cacheable=true)
   public static List<Task> fetchTaskForAccount( string accountName){
    try {
        return [Select id, Subject, Status, Description, What.Name
         From Task WHERE What.Name = :accountName];

        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   } 
    

        
    
}
public with sharing class taskCreationUsingWire {
    
   @AuraEnabled (cacheable=true)
    public static List<Task> taskCreationUsingWire( String subjectString) {
                    return [Select Id, Subject, Status, Priority from Task WHERE Subject =:subjectString];
    }
}
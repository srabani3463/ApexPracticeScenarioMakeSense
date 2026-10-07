public with sharing class independentWireController {
    
    
    @AuraEnabled (cacheable=true)
    public static List<Case> getCase() {
            return [Select Id, Subject, Origin, Description From Case LIMIT 5];
    }
    @AuraEnabled (cacheable=true)
    public static List<Task> getTask() {
            return [Select Id, Subject, Status From Task LIMIT 5];
    }
}
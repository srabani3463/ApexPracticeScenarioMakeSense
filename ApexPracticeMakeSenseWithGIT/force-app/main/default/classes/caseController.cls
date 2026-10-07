public with sharing class caseController {
   

// fetch 20 cases based on their created date
@AuraEnabled (cacheable=true)
public static List<Case> getInSequence(){

    return [Select Id, Origin, Reason, Priority from Case Limit 20];
}



}
trigger OpportunityTrigger on Opportunity (before insert,before update, before delete, after insert, after update, after delete, after undelete) {
    /** Set<Id> AccountSetId = New Set<Id>();// this empty id add opp related account id.
     For(Opportunity opp:Trigger.New){ // get related id which is associte with account.
        if(opp.AccountId <> null){
          AccountSetId.add(opp.AccountId) ; 
        }}
    List<Opportunity> oppfieldupdate = new List <Opportunity>();
    for(Opportunity opp: trigger.new){
        if(opp.Amount != null && opp.Discount__c != null){
            Decimal discount= (opp.Amount*opp.Discount__c)/100;
            Decimal discountAmount = opp.Amount-discount;
            opp.Discounted_Price__c = discountAmount;
        }
        // related parent field 
        //1. First create id set to add the id related to object
        //2. second query the parent object based on the id field related to that object
        //3. check condition if that object id == to related object id.
        //4. Update the value.
        
           // List<Account> acclist = [Select id, Name, Description from Account where Id In:AccountSetId ];// opp related id.
            // how to use map to get the value
        Map<Id,Account> idToAccountMap = New Map<Id,Account>(
            [Select id, Name, Description 
             from Account 
             where Id In:AccountSetId ]
        );
           // For(Account acc: accList){
               // idToAccountMap.put(acc.id,acc);
           // }
            //for(Account acc: accList){// check evevy record
                //if(acc.id == opp.AccountId){
        if(opp.AccountId<>null){
            Account accountRecord = idToAccountMap.get(opp.AccountId);// value realated to opportunity on account details
            opp.description = accountRecord?.Description;
        }
                
            }
           
**/
    SWITCH on Trigger.OperationType{
        WHEN AFTER_INSERT{
            OpportunityTriggerHandler.CrTaskNoAccAssWithOppprtunity(Trigger.New);
        }
    }
}
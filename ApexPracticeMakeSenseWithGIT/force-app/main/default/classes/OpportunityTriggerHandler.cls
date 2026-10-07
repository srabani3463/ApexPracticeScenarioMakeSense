public class OpportunityTriggerHandler {
/**Develop an Apex Trigger so that when an opportunity is created and the account is blank,
//create a task under Opportunity. Hint: - AccountId == null
//1.	Subject- Opportunity is created without Account
//2.	Description- Opportunity is created without Account, Please assign the Correct account to Opportunity.
//3.	Due Date- T odays Date + 7
//4.	Status- Not Started
//5.	Priority- High
//6.	Related To (What) - Opportunity Id
//7.	Assigned To (OwnerId) - Opportunity Owner Id
 // Steps fetch the opp which is related to account id **/
 
    Public Static Void CrTaskNoAccAssWithOppprtunity(List<Opportunity> NewListOpportunity){
        List<Task> NeWTaskList = New List<Task>();
        Set<Id> NewSetOPPId = New Set<Id>();
        For(Opportunity NewOpportunity :NewListOpportunity ){
            if(NewOpportunity.AccountId == Null){
                
                Task T = New Task();
                T.Subject = 'Opportunity is created without Account + --+'+NewOpportunity.Name;
                T.Status = 'Not Started';
                T.Description = 'Opportunity is created without Account, Please assign the Correct account to Opportunity.';
                T.Priority = 'High';
                T.ActivityDate = Date.Today().addDays(7);
                T.WhatId = NewOpportunity.Id;
                T.OwnerId = NewOpportunity.OwnerId;
                NeWTaskList.add(T);
            }
        }
        if(!NeWTaskList.isEmpty()){
            Insert NeWTaskList;
            
        }
    }
}
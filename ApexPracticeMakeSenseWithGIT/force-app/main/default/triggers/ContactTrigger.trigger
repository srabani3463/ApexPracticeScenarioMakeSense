trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete,before update, before insert) {
   /** Switch On Trigger.OperationType{
        WHEN AFTER_INSERT, AFTER_UNDELETE{
            Set<Id> accountIdset = new Set<id>();
            For(Contact con: Trigger.new){
                if(con.AccountId <> null){
                   accountIdset.add(con.AccountId);
                }
                // comare the old value with new value then how to compare
                
            }
            List<AggregateResult> AggregateResults = [Select count(id), AccountId from contact 
                                                      WHERE AccountId IN:accountIdset
                                                      GROUP BY AccountId ];
        List<Account> accountListToUpdate  = New List<Account>();
        For(AggregateResult ar:AggregateResults ){
           // where to store the count of id it is integer 
           Integer totalCount = (Integer)ar.get('expr0');// count id-store
            id accountId = (id)ar?.get('AccountId');// group by id- store
               
            accountListToUpdate.add(    // update the details after insert or delete on account
                new Account(
                    id = accountId,  //  store the id 
                    Total_No_Contact__c = totalCount // store the value in the fields.
                )
            );
            
        
        }update accountListToUpdate;
        }
    WHEN AFTER_UPDATE{
              
            Set<Id> accountIdset = new Set<id>();
        For(Contact Newcontact : Trigger.new){
            // by using oldmap we can get the previous version of new contact
            //  which is related to new contact.
            Contact OldContact = Trigger.oldMap.get(Newcontact.id);
            if( OldContact.AccountId <> Newcontact.AccountId){
                if(OldContact.AccountId !=null){
                   accountIdset.add(OldContact.AccountId);  // decrease no
                    
                }
                if(OldContact.AccountId !=null){
                 accountIdset.add(Newcontact.AccountId);// increase or decrease no latest update
            }   
                }
      
           
            }
         List<AggregateResult> AggregateResults = [Select count(id), AccountId from contact 
                                                      WHERE AccountId IN:accountIdset
                                                      GROUP BY AccountId ];
        List<Account> accountListToUpdate  = New List<Account>();
        For(AggregateResult ar:AggregateResults ){
           // where to store the count of id it is integer 
           Integer totalCount = (Integer)ar.get('expr0');// count id-store
            id accountId = (id)ar?.get('AccountId');// group by id- store
               
            accountListToUpdate.add(    // update the details after insert or delete on account
                new Account(
                    id = accountId,  //  store the id 
                    Total_No_Contact__c = totalCount // store the value in the fields.
                )
            );
            
        
        }update accountListToUpdate;
        
    }
        WHEN AFTER_DELETE{
             Set<Id> accountIdset = new Set<id>();
            For(Contact con: Trigger.old){
                if(con.AccountId <> null){
                   accountIdset.add(con.AccountId);
                }
                // comare the old value with new value then how to compare
                
            }
            List<AggregateResult> AggregateResults = [Select count(id), AccountId from contact 
                                                      WHERE AccountId IN:accountIdset
                                                      GROUP BY AccountId ];
        List<Account> accountListToUpdate  = New List<Account>();
        For(AggregateResult ar:AggregateResults ){
           // where to store the count of id it is integer 
           Integer totalCount = (Integer)ar.get('expr0');// count id-store
            id accountId = (id)ar?.get('AccountId');// group by id- store
               
            accountListToUpdate.add(    // update the details after insert or delete on account
                new Account(
                    id = accountId,  //  store the id 
                    Total_No_Contact__c = totalCount // store the value in the fields.
                )
            );
            
        
        }update accountListToUpdate;   
        }WHEN BEFORE_UPDATE{
             ContactTriggerHandler.UpdateContactFax(Trigger.new, Trigger.old); 
    }    
    If(Trigger.IsBefore && Trigger.IsUpdate){
        ContactTriggerHandler.UpdateContactFax(Trigger.New, Trigger.oldMap);
    }**/
    Switch On Trigger.OperationType{
        WHEN AFTER_INSERT{
            ContactTriggerHandler.UpdateContactRltOpportunity(Trigger.New);
        }
    }
    }
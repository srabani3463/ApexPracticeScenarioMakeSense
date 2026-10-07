public class OppAboveLakh {
    // Give the account name and where opp amount greater than this amount only.
    Public Static void accountWithHighOpp(){
        
        List<Account> accList = [Select id, Name, (Select id, name, accountId,Stagename,  
                               amount from Opportunities Where isclosed=false AND amount > 2500000 ) From Account
                                Where Id in(Select AccountId From Opportunity where isclosed=false AND amount > 2500000 )];
   System.debug('Find the opp List ++++++++'+accList); 
        
        List<Contact> conList = [Select Id,Email, LastName, FirstName, AccountId from contact where AccountId In :accList ];
        
        System.debug('contact '+conList);
        
        Map<id, Boolean> highValueOpp = new Map<id, Boolean>();
        Map<Id, List<contact>> ConListOfHighvalueCs = New Map<Id, List<contact>>();
        
        For(Account acc:accList){
            if(acc.Id !=Null){
               highValueOpp.put(acc.Id,true); 
            }}
            For(Contact con:conList){
                if(highValueOpp.containsKey(con.Id)){
                if(ConListOfHighvalueCs.containskey(con.Id)){
                   List<Contact> conListtoAppend = ConListOfHighvalueCs.get(con.id);
                    conListtoAppend.add(con);
                    ConListOfHighvalueCs.put(con.id,conListtoAppend );
                }
                else{
                    ConListOfHighvalueCs.put(con.id,new List<contact> {con});
                }
    }}
        List<contact> ConListtoCreateTask = new List<contact>();
        For(List<Contact> conLt:ConListOfHighvalueCs.values() ){
            ConListtoCreateTask.addAll(conLt);
            
        }
        List<Task> tList = new List<Task>();
        For(contact con:ConListtoCreateTask) {
            Task t = new task();
            t.whoId = con.Id;
            t.WhatId = con.AccountId;
            tList.add(t);
        }
        insert tList;
    }
    }
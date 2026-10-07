public class AccountTriggerHandler {
    Public static void AccountRelatedTask(List<Account> acclist){
        List<Task> tasklist = new List<Task>();
        //List<Account> acclist = new List<Account>();
        For(Account ac:acclist ){
           Task t = new task();
            t.Subject = 'The Task is created From Apex Trigger'+ac.Name;
            t.Status = 'Not Started';
            t.Priority = 'High';
            t.ActivityDate = system.today().addDays(7);
            t.WhatId =ac.Id;
            t.OwnerId =ac.OwnerId;
            
            insert t;
        }
    }

}
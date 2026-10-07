public class CreatetaskHighvalueAcc {
    

    public static void accountWithHighOpp() {

        // Get Accounts that have an open Opportunity
        // greater than 2,500,000
        List<Account> accList = [
            SELECT Id, Name,
                (SELECT Id, Name, AccountId, StageName, Amount
                 FROM Opportunities
                 WHERE IsClosed = false
                 AND Amount > 2500000)
            FROM Account
            WHERE Id IN (
                SELECT AccountId
                FROM Opportunity
                WHERE IsClosed = false
                AND Amount > 2500000
            )
        ];

        System.debug('High Value Accounts: ' + accList);

        // Store Account IDs
        Set<Id> accountIds = new Set<Id>();

        for (Account acc : accList) {
            accountIds.add(acc.Id);
        }

        // Get Contacts belonging to those Accounts
        List<Contact> conList = [
            SELECT Id, Email, LastName, FirstName, AccountId
            FROM Contact
            WHERE AccountId IN :accountIds
        ];

        System.debug('Contacts: ' + conList);

        // Create Tasks for Contacts
        List<Task> taskList = new List<Task>();

        for (Contact con : conList) {

            Task t = new Task();

            t.WhoId = con.Id;
            t.WhatId = con.AccountId;
            t.Subject = 'Follow up with high-value account';

            taskList.add(t);
        }

        if (!taskList.isEmpty()) {
            insert taskList;
        }
    }
}
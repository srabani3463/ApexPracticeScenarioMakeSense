import { LightningElement, api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import fetchTaskForAccount from '@salesforce/apex/dependentWireController.fetchTaskForAccount';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name'
export default class DepentwireMethod extends LightningElement {
    // drop my component on account recod page
    //This means i wll have the record of the account.c/createCaseListUsingApex
    // using the record id, get the name of account -this will be my first wire.
    // Once i have my account name, i ll call apex to search for tasks 
    // associate to that account name this will be my second wire.

    @api recordId;
    accountName;
    taskList;
    taskFound = false;
    fields = [ACCOUNT_NAME];
    errorMessage;

    // how to call the getrecord
    @wire(getRecord, {recordId: '$recordId', fields: '$fields' })
    wireAccount({data, error}){
        if(data){
            
            this.accountName = data.fields.Name.value;
            console.log('The Account Detais '+JSON.stringify(data));

        }
    else if(error){
        errorMessage = error.body.Message;
    }
}

@wire (fetchTaskForAccount,{accountName: '$accountName'})
wiredTasks({data,error}){
    if(data){
        console.log('Task found ----'+JSON.stringify(data));
        this.taskList = data;
        this.taskFound = true;
    }
    else if(error){

        console.log(error.body.Message);
    }
}

}
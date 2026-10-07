import { LightningElement, wire } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
import { createRecord } from "lightning/uiRecordApi";
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import CASE_OBJ from '@salesforce/schema/Case';
import SUBJECT from '@salesforce/schema/Case.Subject';
import DESCRIPTION from '@salesforce/schema/Case.Description';
import PRIORITY from '@salesforce/schema/Case.Priority';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateCaseWithApex extends NavigationMixin (LightningElement) {
subject='';
priority='';
description='';

// get the meta data from specific object use @wire method.

@wire(getObjectInfo ,{objectApiName:CASE_OBJ} ) caseRecord;
    
get options(){
        return [
            {label:'Low', value:'low'},
            {label:'Medium', value:'medium'},
            {label:'High', value:'high'}

        ]
 
    }
   populateSubject(event){
    console.log(event.detail.value);
    this.subject = event.detail.value

   } 
   populateDescription(event){
    console.log(event.detail.value);
    this.description = event.detail.value

   }
    populatePriority(event){
        console.log(event.detail.value);
       this.priority = event.detail.value
    }
    // every thing is fine
    // now i have the value, now we want to create the case without apex or server side. 
    // i want to call and talk 
    // to the server directly from js.c/createCaseWithApex
    //we have a button so it is event listner.
    // to create record we need two things object apiname and fields.
    async createCase(){
        // object apiname, fields api name
       
                  const fields ={}
                  fields[SUBJECT.fieldApiName ] = this.subject;
                  fields[PRIORITY.fieldApiName ] = this.priority;
                  fields[DESCRIPTION.fieldApiName  ] = this.description;

                  let recordInput = {apiName: CASE_OBJ.objectApiName ,fields};

         await createRecord(recordInput)
         .then((record)=>{
            record.id
            //alert('your case has successfully created'+ record.id);
            this.showToast('Success', 'Your record has been successfully created', 'success', 'sticky');
            this.navigateToRecord(record.id);
         })
         .catch(error=>{
             alert('something goes wrong' +error.body.message);
         });
    }
    navigateToRecord(recordId){
      this[NavigationMixin.Navigate]({
       type:'standard__recordPage',
       attributes: {
        recordId: recordId,
        objectApiName: 'Case',
        actionName: 'view'

       }


      });


    }
    // as soon as case is created, or error will come, you actually want to alert.
    showToast(title, message, variant, mode){
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode

        });
        this.dispatchEvent(event);
    }
}
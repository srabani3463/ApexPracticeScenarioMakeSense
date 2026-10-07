import { LightningElement, wire } from 'lwc';
import getInSequence from '@salesforce/apex/caseController.getInSequence';
export default class CreateCaseListUsingApex extends LightningElement {
  // to baind the method with apex we use wire method.  
    //wire it
    // who to wire
    //Once wire is done do you want to do anything.
    // yes I want to store the data which I received into a variable that I ll use in my html.
    caseList;
    errorMessage;

  @wire (getInSequence)
    wiredCases({data,error}){
     if(data){
        this.caseList = data;
       // if data is there error message is empty
       this.errorMessage = '';
     }
     if(error){
        this.data='Undefined'
       this.errorMessage = error.body.message;
        console.log('Error received while connection get apex:'+ error)
     }

    }
    
  

}
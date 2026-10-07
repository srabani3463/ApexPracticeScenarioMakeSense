import { LightningElement } from 'lwc';
import taskCreationUsingWire from '@salesforce/apex/taskCreationUsingWire.taskCreationUsingWire'

export default class SearchTaskBySubjectImperative extends LightningElement {

    subject;
    taskList;
    errorMessage;
    showTable = false;

   handleSubjectChange(event){
    console.log('The changes got displayed'+ event.target.value);
       this.subject = event.target.value;

   }
   // what do you want to do
//i want to call apex and pass the subject that the user has entered, receive the task list.
// as soon as i receive the task list i ll map it to the variable show that it showing up on the UI.
// once method is called then what happened if something wring what happened
// .then and .catch

   searchTask(){
    taskCreationUsingWire( {subjectString: this.subject})
    .then(result=>{
        console.log('result from apex reseived '+ JSON.stringify(result));
        this.taskList = result;
        this.showTable = true;
    })
    .catch(error=>{
        console.log('its coming error' + JSON.stringify(error) );
        this.errorMessage = error.body.message;
    })

   }


}
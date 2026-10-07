import { LightningElement, wire } from 'lwc';
import taskCreationUsingWire from '@salesforce/apex/taskCreationUsingWire.taskCreationUsingWire';

export default class SearchTaskBySubject extends LightningElement {

    taskList;
    subjectTask='Please Follwup';

    @wire (taskCreationUsingWire, {subjectString: '$subjectTask' })
       wiredTasks({data, error}){
      if(data){
        this.taskList = data;

      }
      if(error){
     console.log('Error: Something wrong '+error.body.message)
}
      }
    
}
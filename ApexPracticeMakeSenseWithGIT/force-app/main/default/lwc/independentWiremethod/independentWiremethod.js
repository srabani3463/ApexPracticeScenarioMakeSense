import { LightningElement, wire } from 'lwc';
import getCase from '@salesforce/apex/independentWireController.getCase';
import getTask from '@salesforce/apex/independentWireController.getTask';

export default class IndependentWiremethod extends LightningElement {

  showCase = false;
  showTask = false;
  wireCases;


   caseList;
   taskList;
@wire (getCase)
 wireCases({data, error}){
 if(data){
    this.caseList = data;
    this.showCase = true;

 }
 if(error){
  this.caseList= undefined;
    error.body.message;
 }
} 
@wire (getTask)
 wireTasks ({data, error}){
 if(data){
    this.taskList = data;
    this.showTask = true;

 }
 if(error){
  this.taskList= undefined;
    error.body.message;
 }
} 


}
import { LightningElement, api } from 'lwc';

export default class LoadArecord extends LightningElement {
    @api recordId;
    objectApiName='Case';
    fields=['CaseNumber','Status','Priority','Reason', 'Type'];
}
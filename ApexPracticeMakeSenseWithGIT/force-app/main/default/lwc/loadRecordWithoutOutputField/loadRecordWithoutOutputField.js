import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { LightningElement, api,wire} from 'lwc';

import CASE_NUMBER from '@salesforce/schema/Case.CaseNumber';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import REASON_FIELD from '@salesforce/schema/Case.Reason';

export default class LoadRecordWithoutOutputField extends LightningElement {

// we dont want to use output fields, or in that matter we do not want to use view-form or form at anyway, 
// we just want to load some data from a specific record on our page 


@api recordId;
 fields = [CASE_NUMBER, STATUS_FIELD,ORIGIN_FIELD,REASON_FIELD];
@wire (getRecord,{recordId: '$recordId', fields:'$fields'}) caseVar;

get casenumber(){
 return getFieldValue(this.caseVar.data,CASE_NUMBER)

} 
get origin(){
 return getFieldValue(this.caseVar.data, ORIGIN_FIELD)

} 
get status(){
 return getFieldValue(this.caseVar.data,STATUS_FIELD )

} 
get reason(){
 return getFieldValue(this.caseVar.data, REASON_FIELD)

} 

}
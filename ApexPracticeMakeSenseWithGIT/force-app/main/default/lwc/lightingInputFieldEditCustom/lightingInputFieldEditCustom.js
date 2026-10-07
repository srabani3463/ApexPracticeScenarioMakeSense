import { LightningElement,api } from 'lwc';

export default class LightingInputFieldEditCustom extends LightningElement {

@api recordId;
objectApiName ='Case';

handleFormSuccess(event){
    // as soon as success happen please resert the form.
    // form+reset 
   const formElement= this.template.querySelector('lightning-record-edit-form')
   formElement.reset();


}
}
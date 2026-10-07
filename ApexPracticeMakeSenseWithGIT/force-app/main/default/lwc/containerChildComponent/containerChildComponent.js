import { LightningElement,api } from 'lwc';

export default class ContainerChildComponent extends LightningElement {
     @api productsFound = false;
      @api productList;
      @api parentCalled= false;

      @api get hasFound(){
           return this.productsFound == 'true' ? true : false;


      }
      @api handleParentCalled(){
           this.ParentCalled= true;

      }
}
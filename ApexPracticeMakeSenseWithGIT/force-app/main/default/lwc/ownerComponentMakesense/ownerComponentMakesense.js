import { LightningElement } from 'lwc';

export default class OwnerComponentMakesense extends LightningElement {
   
productList = [

    {id: '1', name: 'Mac Air' , rating: '3/5'},
    {id: '2', name: 'Mac Pro' , rating: '4/5'},
    {id: '3', name: 'Mac' , rating: '2/5'},
    {id: '4', name: 'Apple 17 Max' , rating: '3/5'},
    {id: '5', name: 'Apple 17 Pro' , rating: '5/5'},

];
callChildMethod(){

    console.log('Parent mathed to call the child method from here')
    this.template.querySelector('c-container-child-component').handleParentCalled();
}

   
    
   }
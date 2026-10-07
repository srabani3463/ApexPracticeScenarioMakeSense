import { LightningElement, track } from 'lwc';
import getTrayData from '@salesforce/apex/HospitalTrayController.getTrayData';

export default class HospitalTrayReceiving extends LightningElement {

@track trays = [];

handleSearch(event){

let serial = event.target.value;

getTrayData({serialNumber:serial})
.then(result => {

this.trays = [...this.trays, ...result];

})
.catch(error => {

console.error(error);

});

}

}
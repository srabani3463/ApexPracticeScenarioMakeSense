import { LightningElement } from 'lwc';

export default class DatabindingMakesense extends LightningElement {
   match ='Football'
    team1 = 'Maxico'
    team2= 'South Africa'
    time = new Date().toLocaleTimeString();
    totaltimematch = 50*2;

    memberStatus;
    hoursofWatch = 50;

    updateMember(event){

        this.memberStatus = event.target.value;

    }
    // getter method and setter method
    _minuteswatched =  (this.hoursofWatch*25);

    get minuteswatched(){

       return this._minuteswatched;

    }
    set minuteswatched(value){
        console.log('reached here')
        this._minuteswatched=value;

    }
handlechange(event){
console.log('reached here')
    this.minuteswatched = parseInt(event.target.value);
}
}
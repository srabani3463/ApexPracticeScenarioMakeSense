import { LightningElement } from 'lwc';

export default class RecativeTrackcomMakeSense extends LightningElement {
    userAddress = '9967 Hidden Falls Fishers';

    
    personalDetails = [{id:'0',name:'Ravi',address:'9956,fishers',phone:'412321',
        gender:'male',age:'35',marritalStatus:'married'}]

        "friends"=

[{friendsid:'1', friendsName:'Shastri', friendsCountry:'USA'}]
        ;
    

updateAddress(){

        this.userAddress = '9967 Hidden Falls Circle, Fishers, Indiana';
        this.personalDetails[0].name ='Sam';
        this.personalDetails[0].friends[0].friendsCountry = 'India';
    }
    

}
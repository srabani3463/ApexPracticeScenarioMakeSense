import { LightningElement,api,track } from 'lwc';

export default class Varbledeclarationmakesense extends LightningElement {
    @api membername = 'Kanil';
    @api memberage = 5;
    @track myDetails = {
         name :'Kiash  Das',
         Education:'Master'

    }

  @api myFavTeam = 'Rajasthan Raoya';
}
import { LightningElement,api } from 'lwc';

export default class DemoPvtParentCom extends LightningElement {

    team = 'Favourite Team'
    @api name= 'parent'
}
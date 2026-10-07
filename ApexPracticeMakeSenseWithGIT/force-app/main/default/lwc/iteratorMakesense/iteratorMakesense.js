import { LightningElement } from 'lwc';

export default class IteratorMakesense extends LightningElement {

    taskList=[
        {taskid:1, taskName:'Study', taskPriority: 'High', taskStatus: 'Till Pending'},
        {taskid:2, taskName:'Kids', taskPriority: 'Medium', taskStatus: 'Till Pending'},
        {taskid:3, taskName:'Cooking', taskPriority: 'High', taskStatus: 'Pogress'}
    ]
}
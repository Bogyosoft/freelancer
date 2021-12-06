import { SourceDTO } from "./source";
import { User } from "./user";

export class JobDto {
    id?:number;
    item?:Item;
    freelancer?:User;
}

export class Item {
    id?:number
    properties?:string
    destiantion?:string
    status?:string
    source?:SourceDTO
}

export class Job{
    id?:number;
    itemLocation?:string;
    itemDestination?:string;
    itemStatus?:string;
    freelancer?:string;

    constructor(jobDto:JobDto){
        this.id = jobDto.id
        this.itemDestination = jobDto.item?.destiantion
        this.itemLocation = jobDto.item?.source?.location
        this.itemStatus = jobDto.item?.status
        this.freelancer = jobDto.freelancer?.username
    }
}
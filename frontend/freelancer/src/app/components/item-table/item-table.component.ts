import { Component, OnInit } from '@angular/core';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'app-item-table',
  templateUrl: './item-table.component.html',
  styleUrls: ['./item-table.component.css']
})
export class ItemTableComponent implements OnInit {

  columnsToDisplay:string[] = [
    'id',
    'properties',
    'destination',
    'status'
  ]

  displayedColumns:string[] = [
    'id',
    'properties',
    'destination',
    'status'
  ]

  items!:any;

  constructor(private service:RestapiService) { }

  ngOnInit(): void {
    this.getItems();
  }

  httpCall:any
  getItems(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getUsers().subscribe(data=>{
      console.log(data)
      this.items = data;
    })
  }

}

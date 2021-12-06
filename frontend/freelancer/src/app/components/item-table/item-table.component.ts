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

  deleteItem(id:number){
    this.service.deleteItem(id).subscribe(data => {
      if(data.toString.length !> 0){
        window.alert("Couldnt delete item!")
      }
    })
    this.getItems()
  }

  httpCall:any
  getItems(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getItems().subscribe(data=>{
      console.log(data)
      this.items = data;
    })
  }

}

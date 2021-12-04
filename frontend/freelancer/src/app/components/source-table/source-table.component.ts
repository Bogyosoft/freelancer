import { Component, OnInit } from '@angular/core';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'app-source-table',
  templateUrl: './source-table.component.html',
  styleUrls: ['./source-table.component.css']
})
export class SourceTableComponent implements OnInit {

  columnsToDisplay:string[] = [
    'id',
    'location',
    'owner',
  ]

  displayedColumns:string[] = [
    'id',
    'location',
    'owner'
  ]

  sources!:any;

  constructor(private service:RestapiService) { }

  ngOnInit(): void {
    this.getSources();
  }

  httpCall:any
  getSources(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getUsers().subscribe(data=>{
      console.log(data)
      this.sources = data;
    })
  }

}

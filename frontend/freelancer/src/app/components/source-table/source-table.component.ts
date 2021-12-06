import { Component, OnInit } from '@angular/core';
import { SourceDTO } from 'src/app/entities/source';
import { Sourcew } from 'src/app/entities/sourcew';
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

  sources:Sourcew[] = [];

  constructor(private service:RestapiService) { }

  ngOnInit(): void {
    this.getSources();
  }

  httpCall:any
  getSources(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getSources().subscribe((data:SourceDTO[])=>{
      let sources:Sourcew[] = []
      data.forEach(s => {

        let sourcew = new Sourcew();
        sourcew.id = s.id;
        sourcew.location = s.location
        sourcew.owner = s.owner?.username
        sources.push(sourcew)
        console.log("souce")
        console.log(this.sources)
      })
      this.sources = sources

    })
  }

}

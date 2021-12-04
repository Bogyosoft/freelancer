import { Component, OnInit } from '@angular/core';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'app-job-table',
  templateUrl: './job-table.component.html',
  styleUrls: ['./job-table.component.css']
})
export class JobTableComponent implements OnInit {

  columnsToDisplay:string[] = [
    'id',
    'item',
    'freelancer',
  ]

  displayedColumns:string[] = [
    'id',
    'item',
    'freelancer',
  ]

  jobs!:any;
  
  constructor(private service:RestapiService) { }

  ngOnInit(): void {
    this.getJobs();
  }

  httpCall:any
  getJobs(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getJobs().subscribe(data=>{
      console.log(data)
      this.jobs = data;
    })
  }

}

import { Component, OnInit } from '@angular/core';
import { Job, JobDto } from 'src/app/entities/job';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'app-job-table',
  templateUrl: './job-table.component.html',
  styleUrls: ['./job-table.component.css']
})
export class JobTableComponent implements OnInit {

  columnsToDisplay:string[] = [
    'id',
    'itemLocation',
    'itemDestination',
    'itemStatus',
    'freelancer',
  ]

  displayedColumns:string[] = [
    'id',
    'itemLocation',
    'itemDestination',
    'itemStatus',
    'freelancer',
  ]

  jobs:Job[] = [];

  constructor(private service:RestapiService) { }

  ngOnInit(): void {
    this.getJobs();
  }

  deleteJob(id:number){
    this.service.deleteJob(id).subscribe(data => {
      if(data.toString.length !> 0){
        window.alert("Couldnt delete item!")
      }
    })
    this.getJobs()
  }

  httpCall:any
  getJobs(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getJobs().subscribe((data:JobDto[])=>{
      console.log(data)
      let jobs:Job[] = []
      data.forEach((j:JobDto) => {
        jobs.push(new Job(j))
      })
      this.jobs = jobs;
    })
  }

}

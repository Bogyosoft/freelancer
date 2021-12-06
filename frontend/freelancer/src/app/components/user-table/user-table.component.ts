import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/entities/user';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'app-user-table',
  templateUrl: './user-table.component.html',
  styleUrls: ['./user-table.component.css']
})
export class UserTableComponent implements OnInit {

  columnsToDisplay:string[] = [
    'id',
    'username',
    'role',
    'score'
  ]

  displayedColumns:string[] = [
    'id',
    'username',
    'role',
    'score'
  ]

  users!:any;

  constructor(private service:RestapiService) { }

  ngOnInit(): void {
    this.getUsers()
  }

  deleteUser(id:number){
    this.service.deleteUser(id).subscribe(data => {
      if(data.toString.length !> 0){
        window.alert("Couldnt delete user!")
      }
    })
    this.getUsers()
  }

  httpCall:any
  getUsers(){
    if(this.httpCall){
      this.httpCall.unsubsribe();
    }
    this.service.getUsers().subscribe(data=>{
      console.log(data)
      this.users = data;
    })
  }
}

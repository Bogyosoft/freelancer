import { Component, OnInit, SimpleChanges } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthGuardService } from 'src/app/services/auth-guard.service';
import { AuthService } from 'src/app/services/auth.service';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'home-component',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  title = 'vmat-front-concept';
  message?:string = '';

  constructor(private service:RestapiService, private authGuard:AuthService, private router:Router) {  }
  tabs = ['Users','Jobs','Sources','Items'];
  selected = new FormControl(0);

  ngOnInit(): void {
    if(!this.authGuard.loggedIn){
      this.router.navigate(["/login"])
    }
  }

  setQuery(){

  }

}
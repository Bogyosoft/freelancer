import { Component, OnInit, SimpleChanges } from '@angular/core';
import { FormControl } from '@angular/forms';
import { RestapiService } from 'src/app/services/restapi.service';

@Component({
  selector: 'home-component',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  title = 'vmat-front-concept';
  message?:string = '';

  constructor(private service:RestapiService) {  }
  tabs = ['Users','Jobs','Sources','Items'];
  selected = new FormControl(0);

  ngOnInit(): void {
  }

  setQuery(){

  }

}
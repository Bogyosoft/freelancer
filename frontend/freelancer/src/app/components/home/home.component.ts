import { Component, OnInit } from '@angular/core';
import { HttpErrorResponse } from '@angular/common/http';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { RestapiService } from '../restapi.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  title = 'vmat-front-concept';
  services!:string[];
  helmCharts!:string[];
  selectedService!:string;
  selectedReport!:string;
  selectedHelmChart!:string

  message?:string;


  tabs = ['QUERY 1'];
  selected = new FormControl(0);

  constructor(private service: RestapiService, private router:Router) {  }
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  addTab() {
    this.tabs.push('QUERY ' + (this.tabs.length + 1));
    this.selected.setValue(this.tabs.length - 1);
  }

  removeTab(index: number) {
    this.tabs.splice(index, 1);
  }
}

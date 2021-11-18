import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from './../environments/environment';
import { User } from './user';

@Injectable({
  providedIn: 'root'
})
export class RestapiService {

  apiUrl?:string

  constructor(private http:HttpClient) {
    this.apiUrl = environment.apiUrl
  }

  public getUsers(){
    this.http.get(this.apiUrl + "/users", { withCredentials:true })
  }

  public getSources(){
    this.http.get(this.apiUrl + "/sources", { withCredentials:true })
  }

  public getItems(){
    this.http.get(this.apiUrl + "/items", { withCredentials:true })
  }

  public getJobs(){
    this.http.get(this.apiUrl + "/jobs", { withCredentials:true })
  }

  public postUser(user:User){
    this.http.post(this.apiUrl + "/users", user, { withCredentials:true })
  }
}

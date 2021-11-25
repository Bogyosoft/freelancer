import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { User } from '../entities/user';

@Injectable({
  providedIn: 'root'
})
export class RestapiService {

  apiUrl?:string

  constructor(private http:HttpClient) {
    this.apiUrl = environment.apiUrl
  }

  public getUsers(){
    console.log(this.apiUrl + "/user")
    return this.http.get(this.apiUrl + "/user", { withCredentials:true })
  }

  public getSources(){
    return this.http.get(this.apiUrl + "/source", { withCredentials:true })
  }

  public getItems(){
    return this.http.get(this.apiUrl + "/item", { withCredentials:true })
  }

  public getJobs(){
    return this.http.get(this.apiUrl + "/job", { withCredentials:true })
  }

  public postUser(user:User){
    return this.http.post(this.apiUrl + "/users", user, { withCredentials:true })
  }
}
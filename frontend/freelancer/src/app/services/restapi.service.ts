import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { User } from '../entities/user';
import { UserDto } from '../entities/user-dto';
import { SourceDTO } from '../entities/source';
import { JobDto } from '../entities/job';

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
    return this.http.get<SourceDTO[]>(this.apiUrl + "/sources", { withCredentials:true })
  }

  public getItems(){
    return this.http.get(this.apiUrl + "/items", { withCredentials:true })
  }

  public getJobs(){
    return this.http.get<JobDto[]>(this.apiUrl + "/jobs", { withCredentials:true })
  }

  public postUser(user:User){
    return this.http.post(this.apiUrl + "/user", user, { withCredentials:true })
  }

  public login(user:UserDto){
    return this.http.post(this.apiUrl + "/auth", user, { withCredentials:true });
  }

  public logout() {
    return this.http.get(this.apiUrl + "/user/logout",{ withCredentials:true });
  }

  public deleteUser(id:number){
    return this.http.delete(this.apiUrl + "/user/" + id, { withCredentials:true })
  }

  public deleteItem(id:number){
    return this.http.delete(this.apiUrl + "/items/" + id, { withCredentials:true })
  }

  public deleteJob(id:number){
    return this.http.put(this.apiUrl + "/jobs/" + id, { withCredentials:true })

  }
}
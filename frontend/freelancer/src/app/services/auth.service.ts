import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { UserDto } from '../entities/user-dto';
import { RestapiService } from './restapi.service';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  loggedIn: boolean;

  constructor(private service:RestapiService, private router:Router) {
    this.loggedIn = false;
  }

  login(user:UserDto) {
    this.service.login(user).subscribe((response:any) => {
      if(response.status == "ok")
        this.loggedIn = true;
        this.router.navigate(['home'])
    })
  }

  logout() {
    this.service.logout().subscribe((response:any) => {
      console.log(response)
      this.loggedIn = false;
      this.router.navigate(["login"])
    })
  }

  isLoggedIn(): Promise<boolean> {
    return new Promise((resolve, reject) => {
      resolve(this.loggedIn);
    });
  }
}

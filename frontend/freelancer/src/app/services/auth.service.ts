import { Injectable } from '@angular/core';
import { UserDto } from '../entities/user-dto';
import { RestapiService } from './restapi.service';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  loggedIn: boolean;

  constructor(private service:RestapiService) {
    this.loggedIn = false;
  }

  login(user:UserDto) {
    this.service.login(user)
  }

  logout() {
    this.loggedIn = false;
  }

  isLoggedIn(): Promise<boolean> {
    return new Promise((resolve, reject) => {
      resolve(this.loggedIn);
    });
  }
}

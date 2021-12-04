import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule  } from '@angular/forms';
import { Router } from '@angular/router';
import { UserDto } from 'src/app/entities/user-dto';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  constructor(private authService: AuthService, private router:Router) {}

  ngOnInit(): void {}

  form: FormGroup = new FormGroup({
    username: new FormControl(),
    password: new FormControl(),
  });

  submit() {
    console.log("log"  + this.form.value)
    if (this.form.valid) {
      this.login();
      this.submitEM.emit(this.form.value);
    }
    if(this.authService.loggedIn == true){
      this.router.navigate(['home'])
    }
  }
  @Input() error: string | null | undefined;

  @Output() submitEM = new EventEmitter();

  login() {
    let user:UserDto = new UserDto();
    user.username = this.form.value.username
    user.password = this.form.value.password
    this.authService.login(user);
  }
}


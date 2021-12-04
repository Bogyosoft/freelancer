import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule  } from '@angular/forms';
import { UserDto } from 'src/app/entities/user-dto';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  constructor(private authService: AuthService) {}

  ngOnInit(): void {}

  form: FormGroup = new FormGroup({
    username: new FormControl(''),
    password: new FormControl(''),
  });

  submit() {
    console.log("log"  + this.form)
    //if (this.form.valid) {
      //this.login();
      //this.submitEM.emit(this.form.value);
    //}
  }
  @Input() error: string | null | undefined;

  @Output() submitEM = new EventEmitter();

  login() {
    let user:UserDto = new UserDto();
    console.log(this.form)
    //this.authService.login(user);
  }
}


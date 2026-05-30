import { Component, OnInit } from '@angular/core';
import { UntypedFormControl, UntypedFormGroup, Validators } from '@angular/forms';
import { AuthService } from '@core/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss' , '../../../app.component.scss'],
})
export class LoginComponent implements OnInit {
  form: UntypedFormGroup = new UntypedFormGroup({
    username: new UntypedFormControl(null, Validators.required),
    password: new UntypedFormControl(null, Validators.required),
  });

  constructor(public authService: AuthService) {}

  ngOnInit(): void {}

  login() {
    if (!this.form.valid) {
      return;
    }

    this.authService.login(this.form.value).subscribe({
      next: () => {},
      error: () => {
        window.alert('Wrong username or password! Please try again!');
      },
    });
  }
}

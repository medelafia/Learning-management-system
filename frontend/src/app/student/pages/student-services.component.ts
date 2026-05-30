import { Component, OnInit } from '@angular/core';
import { SidenavItem } from '@core/models/sidenav-item.model';

@Component({
  selector: 'app-student-services',
  templateUrl: './student-services.component.html',
  styleUrls: ['./student-services.component.scss'],
})
export class StudentServicesComponent implements OnInit {
  items: (SidenavItem | '-')[] = [
    {
      text: 'My subjects',
      link: '/student-services/my-subjects',
       icon: 'users'

    },
    {
      text: 'Subject enrollments',
      link: '/student-services/subject-enrollments',
       icon: 'users'

    },
    '-',
    {
      text: 'Exam terms registration',
      link: '/student-services/exam-terms-registration',
       icon: 'users'

    },
    {
      text: 'Exam realizations',
      link: '/student-services/exam-realizations',
       icon: 'users'

    },
    '-',
    {
      text: 'My info',
      link: '/student-services/my-info',
       icon: 'users'

    },
    {
      text: 'My thesis',
      link: '/student-services/my-thesis',
       icon: 'users'

    },
  ];

  constructor() {}

  ngOnInit(): void {}
}

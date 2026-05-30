import { Component, OnInit } from '@angular/core';
import { SidenavItem } from '@core/models/sidenav-item.model';

@Component({
  selector: 'app-teacher-services',
  templateUrl: './teacher-services.component.html',
  styleUrls: ['./teacher-services.component.scss'],
})
export class TeacherServicesComponent implements OnInit {
  items: (SidenavItem | '-')[] = [
    {
      text: 'My subjects',
      link: '/teacher-services/my-subjects',
      icon: 'users'
    },
    {
      text: 'Subject materials',
      link: '/teacher-services/subject-materials',
       icon: 'users'
    },
    {
      text: 'Subject notifications',
      link: '/teacher-services/subject-notifications',
       icon: 'users'
    },
    {
      text: 'Subject terms',
      link: '/teacher-services/subject-terms',
      icon: 'users'
    },
    {
      text: 'Subject enrollments',
      link: '/teacher-services/subject-enrollments',
       icon: 'users'
    },
    '-',
    {
      text: 'Exams',
      link: '/teacher-services/exams',
       icon: 'users'
    },
    {
      text: 'Exam realizations',
      link: '/teacher-services/exam-realizations',
       icon: 'users'
    },
    '-',
    {
      text: 'Students',
      link: '/teacher-services/students',
       icon: 'users'
    },
    {
      text: 'Theses',
      link: '/teacher-services/theses',
       icon: 'users'
    },
  ];

  constructor() {}

  ngOnInit(): void {}
}

import { Component, OnInit } from '@angular/core';
import { SidenavItem } from '@core/models/sidenav-item.model';

@Component({
  selector: 'app-admin-panel',
  templateUrl: './admin-panel.component.html',
  styleUrls: ['./admin-panel.component.scss'],
})
export class AdminPanelComponent implements OnInit {
  items: (SidenavItem | '-')[] = [
    {
      text: 'Faculties',
      link: '/admin-panel/faculties',
       icon: 'person'

    },
    {
      text: 'Study programs',
      link: '/admin-panel/study-programs',
       icon: 'users'

    },
    {
      text: 'Subjects',
      link: '/admin-panel/subjects',
       icon: 'users'

    },
    {
      text: 'Theses',
      link: '/admin-panel/theses',
       icon: 'users'

    },
    '-',
    {
      text: 'Students',
      link: '/admin-panel/students',
       icon: 'users'

    },
    {
      text: 'Teachers',
      link: '/admin-panel/teachers',
       icon: 'users'

    },
    {
      text: 'Administrators',
      link: '/admin-panel/administrators',
       icon: 'users'

    },
    '-',
    {
      text: 'Exam periods',
      link: '/admin-panel/exam-periods',
       icon: 'users'

    },
    {
      text: 'Exam terms',
      link: '/admin-panel/exam-terms',
       icon: 'users'

    },
    {
      text: 'Exam types',
      link: '/admin-panel/exam-types',
       icon: 'users'

    },
    '-',
    {
      text: 'Countries',
      link: '/admin-panel/countries',
       icon: 'users'

    },
    {
      text: 'Cities',
      link: '/admin-panel/cities',
       icon: 'users'

    },
    {
      text: 'Addresses',
      link: '/admin-panel/addresses',
       icon: 'users'

    },
  ];

  constructor() {}

  ngOnInit(): void {}
}

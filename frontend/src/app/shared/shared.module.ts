import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { MatSortModule } from '@angular/material/sort';
import { MatIconModule } from '@angular/material/icon';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { ToolbarComponent } from './components/toolbar/toolbar.component';
import { FooterComponent } from './components/footer/footer.component';
import { TableComponent } from './components/table/table.component';
import { DialogFormComponent } from './components/dialog-form/dialog-form.component';
import { DialogDeleteComponent } from './components/dialog-delete/dialog-delete.component';
import { ContainerComponent } from './components/container/container.component';
import { SidenavComponent } from './components/sidenav/sidenav.component';
import { ImportExportComponent } from './components/import-export/import-export-component';
import { DialogImportComponent } from './components/dialog-import/dialog-import.component';
import { DialogUploadComponent } from './components/dialog-upload/dialog-upload.component';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatTableModule } from '@angular/material/table';
import { MatPseudoCheckboxModule } from '@angular/material/core';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatDialogModule } from '@angular/material/dialog';
import { MatInputModule } from '@angular/material/input';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card';
import { MatTabsModule } from '@angular/material/tabs';
import { MatCheckboxModule } from '@angular/material/checkbox';



@NgModule({
  declarations: [
    NotFoundComponent,
    ToolbarComponent,
    FooterComponent,
    TableComponent,
    DialogFormComponent,
    DialogDeleteComponent,
    ContainerComponent,
    SidenavComponent,
    ImportExportComponent,
    DialogImportComponent,
    DialogUploadComponent,
  ],
  imports: [
    CommonModule,
    RouterModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatInputModule,
    MatAutocompleteModule,
    MatFormFieldModule,
    MatCheckboxModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
    MatIconModule,
    MatDialogModule,
    MatSidenavModule,
    MatToolbarModule,
    MatListModule,
    MatCardModule,
    MatTabsModule,
  ],
  exports: [
    CommonModule,
    RouterModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatInputModule,
    MatAutocompleteModule,
    MatFormFieldModule,
    MatCheckboxModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
    MatIconModule,
    MatDialogModule,
    MatSidenavModule,
    MatToolbarModule,
    MatListModule,
    MatCardModule,
    MatTabsModule,
    NotFoundComponent,
    ToolbarComponent,
    FooterComponent,
    TableComponent,
    DialogFormComponent,
    DialogDeleteComponent,
    ContainerComponent,
    SidenavComponent,
    ImportExportComponent,
    DialogImportComponent,
    DialogUploadComponent,
  ],
})
export class SharedModule {}

import { Component, Inject, OnInit } from '@angular/core';
import { UntypedFormControl, Validators } from '@angular/forms';
import { MatLegacyDialogRef as MatDialogRef, MAT_LEGACY_DIALOG_DATA as MAT_DIALOG_DATA } from '@angular/material/legacy-dialog';

@Component({
  selector: 'app-dialog-import',
  templateUrl: './dialog-import.component.html',
  styleUrls: ['./dialog-import.component.scss'],
})
export class DialogImportComponent implements OnInit {
  name: string;

  form: UntypedFormControl = new UntypedFormControl(null, [Validators.required]);

  constructor(
    @Inject(MAT_DIALOG_DATA) name: string,
    public dialogRef: MatDialogRef<DialogImportComponent>
  ) {
    this.name = name;
  }

  ngOnInit(): void {
    this.dialogRef.updateSize('100vw');
  }

  confirm() {
    if (this.form.invalid) {
      this.form.markAsTouched();
      return;
    }

    this.dialogRef.close(this.form.value);
  }
}

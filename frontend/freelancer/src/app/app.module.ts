import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { ProfileComponent } from './profile/profile.component';
import { LoginComponent } from './login/login.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { RouterModule } from '@angular/router';
import { RestapiService } from './restapi.service';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { FormsModule , ReactiveFormsModule } from '@angular/forms';
import "@angular/compiler";
import { MatSelectModule } from '@angular/material/select';
import { MatOptionModule } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatCheckboxModule} from '@angular/material/checkbox';
import { CommonModule } from '@angular/common';
import {MatTabsModule} from '@angular/material/tabs';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import { TableTemplateComponent } from './table-template/table-template.component';
import {MatSortModule} from '@angular/material/sort';
import { MatInputModule } from '@angular/material/input';
import { Routes} from '@angular/router';
import { HomeComponent } from './home/home.component';
import {DragDropModule} from '@angular/cdk/drag-drop';
import { MatProgressBarModule} from '@angular/material/progress-bar';
import {ScrollingModule} from '@angular/cdk/scrolling';
import {CdkTableModule} from '@angular/cdk/table';
import {CdkTreeModule} from '@angular/cdk/tree';
import { AppRoutingModule } from './app-routing.module';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    ProfileComponent,
    LoginComponent,
    PageNotFoundComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    MatSelectModule,
    FormsModule,
    BrowserAnimationsModule,
    MatOptionModule,
    MatFormFieldModule,
    MatProgressSpinnerModule,
    MatCheckboxModule,
    CommonModule,
    MatTabsModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatInputModule,
    DragDropModule,
    ScrollingModule,
    CdkTableModule,
    CdkTreeModule,
    MatProgressBarModule,
    RouterModule.forRoot([
      {path: '', redirectTo: 'home', pathMatch:'full' }
    ])
  ],
  providers: [RestapiService],
  bootstrap: [AppComponent]
})
export class AppModule {}

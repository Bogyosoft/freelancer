import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './modules/app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { HomeComponent } from './components/home/home.component';
import { ProfileComponent } from './components/profile/profile.component';
import { LoginComponent } from './components/login/login.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { TableTemplateComponent } from './components/table-template/table-template.component';
import {MatTabsModule} from '@angular/material/tabs';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import { HttpClientModule } from '@angular/common/http';
import {MatSelectModule} from '@angular/material/select';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatPaginatorModule} from '@angular/material/paginator';
import {DragDropModule} from '@angular/cdk/drag-drop';
import {MatSortModule} from '@angular/material/sort';
import {MatInputModule} from '@angular/material/input';


import {MatTableModule} from '@angular/material/table';
import { UserTableComponent } from './components/user-table/user-table.component';
import { ItemTableComponent } from './components/item-table/item-table.component';
import { SourceTableComponent } from './components/source-table/source-table.component';
import { JobTableComponent } from './components/job-table/job-table.component';


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    ProfileComponent,
    LoginComponent,
    PageNotFoundComponent,
    TableTemplateComponent,
    UserTableComponent,
    ItemTableComponent,
    SourceTableComponent,
    JobTableComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatPaginatorModule,
    MatTableModule,
    MatInputModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    DragDropModule,
    MatSelectModule,
    MatFormFieldModule,
    MatButtonModule,
    MatTabsModule,
    MatSortModule,
    MatProgressSpinnerModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}

import { animate, state, style, transition, trigger } from '@angular/animations';
import { AfterViewInit, Component, EventEmitter, Input, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { FormControl } from '@angular/forms';
import { MatSelectChange } from '@angular/material/select';

@Component({
  selector: 'app-table-template',
  templateUrl: './table-template.component.html',
  styleUrls: ['./table-template.component.css'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({height: '0px', minHeight: '0'})),
      state('expanded', style({height: '*'})),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class TableTemplateComponent implements OnInit, OnChanges {
  @Input() data!:any[];
  @Input() tableData!:MatTableDataSource<any>;
  @Input() displayedColumns!:string[];
  @Input() columnsToDisplay!:string[];
  @Input() deletable:boolean = false;
  expandedElement!: any | null;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort, {static: false}) sort!: MatSort;
  @ViewChild(MatTable) table!: MatTable<any>;
  previousIndex!: number;
  filter:FormControl = new FormControl();

  constructor() { }
  ngOnInit(): void {

  }

  ngOnChanges(changes: SimpleChanges): void {
    this.setTableData();
    console.log("change")
    this.sort.sortChange.subscribe(val => {
      this.tableData.data.sort((a,b)=>{
        return a[val.active] > b[val.active] ? 1 : -1;
      })
      this.table.renderRows();
    });   
  }

  setTableData(){
    this.tableData = new MatTableDataSource(this.data);
    console.log(this.data);
    setTimeout(() => {
    this.tableData.paginator = this.paginator;
    this.tableData.sort = this.sort;
    this.tableData.filterPredicate = function(data:string, filter): boolean {
      let dataString : string = JSON.stringify(data).toLowerCase();
      console.log({data},{filter});
      let filters:string[] = filter.split(',');
      for(let i = 0; i < filters.length; i++){
        console.log(filters.length,"filter:",filters[i], {dataString});
        if(dataString.includes(filters[i])){
          console.log(true);
          return true;
        }
      }
      return false;
    };
    });
    console.log("data",this.tableData.data);
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.tableData.filter = filterValue.trim().toLowerCase();

    if (this.tableData.paginator) {
      this.tableData.paginator.firstPage();
    }
  }

  distinct(self:any[], column:string) {
    return self.filter(
      (thing, i, arr) => arr.findIndex(t => t[column] === thing[column]) === i
    );
  }

  setDisplayedColumns() {
    this.displayedColumns.forEach(( column, index) => {
      console.log("set")
      this.displayedColumns[index] = column;
    });
  }


  filterElements:string = "";
  columnFilterChange(event:EventEmitter< MatSelectChange >, column:string) {

    if(Array.isArray(event) && event.length){
      let selectedElements : string[] = [];
      let selectedElementsJoined = "";
      event.forEach(selectedValue => {
        selectedElements.push( selectedValue[column as keyof MatSelectChange].trim().toLowerCase());
        selectedElementsJoined= selectedElements.join(',');
      })
      console.log(selectedElements);
      this.tableData.filter = selectedElementsJoined;
    }else{
      this.tableData.filter = "";
    }
  }

  dragStarted(event: any, index: number ) {
    this.previousIndex = index;
  }

  drop(event:any ) {
    console.log(event)
    if(event){
      moveItemInArray(this.displayedColumns, event.previousIndex, event.currentIndex);
      this.displayedColumns = [...this.displayedColumns];
      this.setDisplayedColumns();
      this.table.renderRows();
    }
  }

  dropListDropped(event: CdkDragDrop<any, any>, index: number) {
    if (event) {
      console.log(event);
      moveItemInArray(this.displayedColumns, this.previousIndex, index);
      this.displayedColumns = [...this.displayedColumns];
      this.setDisplayedColumns();
    }
  }
}
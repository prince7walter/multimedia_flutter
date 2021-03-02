import 'package:flutter/material.dart';

class listeMail extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
      ),
      body: DataTableExample(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context,'/newmail'),
          tooltip: 'Increment',
          child: Icon(Icons.add),
    ),
    );
  }
}


class DataTableExample extends StatefulWidget {
  const DataTableExample({Key key}) : super(key: key);

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Mail Envoyés'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
        },
        columns: kTableColumns,
        source: DessertDataSource(),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text('Destinataie'),
  ),
  DataColumn(
    label: Text('Object'),
    tooltip: '',
    numeric: true,
  ),
  DataColumn(
    label: Text('Date'),
    numeric: true,
  ),


];

////// Data class.
class Dessert {
  Dessert(this.nom, this.message, this.date);
  final String nom;
  final String message;
  final String date;

  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    Dessert('Nanihio', 'Message Reçu', '8:10 AM'),
    Dessert('Kouamé', 'Message Reçu', 'Février 26'),
    Dessert('Soumahoro','Message Reçu', 'Février 25'),
    Dessert('Kouadio', 'Message Reçu', 'Février 25'),
    Dessert('Kouassi', 'Message Reçu', 'Février 22'),
    Dessert('Sanogo', 'Message Reçu',  'Février 20'),
    Dessert('Salifou', 'Message Reçu', 'Février 20'),
    Dessert('Koné', 'Message Reçu','Février 08'),
    Dessert('Allah', 'Message Reçu', 'Février 05'),
    Dessert('Fry', 'Message Reçu',  'Février 05'),
    Dessert('Ouattara', 'Message Reçu', 'Février 04')

  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(Text(dessert.nom)),
          DataCell(Text(dessert.message)),
          DataCell(Text(dessert.date)),
        ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
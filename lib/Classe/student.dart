import 'package:flutter/material.dart';


class Student extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Etudiant'),
        ),
       body: DataTableExample(),
        floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context,'/newmail'),
        tooltip: 'Increment',
          child: Icon(Icons.message),

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
        header: const Text('Liste Etudiant'),
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
    label: Text('Noms'),
  ),
  DataColumn(
    label: Text('Prénoms'),
    tooltip: 'The total amount of food energy in the given serving size.',
    numeric: true,
  ),
  DataColumn(
    label: Text('Matricule'),
    numeric: true,
  ),
];

////// Data class.
class Dessert {
  Dessert(this.nom, this.prenom, this.matri);
  final String nom;
  final String prenom;
  final int matri;
  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    Dessert('Nanihio', 'Cynthia', 12374),
    Dessert('Kouamé', 'Prince', 65490),
    Dessert('Soumahoro','Abou', 321160),
    Dessert('Kouadio', 'Stephane', 78937),
    Dessert('Kouassi', 'Lorraine', 987160),
    Dessert('Sanogo', 'Aziz', 78900),
    Dessert('Salifou', 'Erwin', 04562),
    Dessert('Houndji', 'Lionel', 32123),
    Dessert('Ayenon', 'Marc', 250456),
    Dessert('Kassamba','Samuel', 321260),
    Dessert('Aka', 'Christian', 45660),
    Dessert('Konan', 'Elisee', 78990),
    Dessert('Kamo', 'Zoe', 789160),
    Dessert('Koné', 'Hermann', 12337),
    Dessert('Allah', 'Orlane',147345),
    Dessert('Fry', 'Kanga', 25800),
    Dessert('Ouattara', 'Christelle', 02),
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
          DataCell(Text(dessert.prenom)),
          DataCell(Text('${dessert.matri}')),
        ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}


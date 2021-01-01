import 'package:RadELT/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CacheScreen extends StatefulWidget {
  @override
  _CacheScreenState createState() => _CacheScreenState();
}

class _CacheScreenState extends State<CacheScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('کیف پول'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,left: 20,right: 20
              ),
              child: Column(
                children: [
                  _cacheInfo(context),
                  Divider(),
                  HorizontalTable(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Table HorizontalTable() {
    return Table(
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'تاریخ',
                                  ),
                                ),DataColumn(
                                  label: Text(
                                    'میزان پرداختی',
                                  ),
                                ),DataColumn(
                                  label: Text(
                                    'نوع',
                                  ),
                                ),DataColumn(
                                  label: Text(
                                    'توضیحات',
                                  ),
                                )
                              ],
                              rows: const <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('4/5/99')),
                                    DataCell(Text('100000')),
                                    DataCell(Text('کیف پول')),
                                    DataCell(Text('بابت دوره آموزشی')
                                    ),
                                  ],
                                ),
                              ],
                          )
                        ),
                      ],
                    ),
                  ],
                );
  }


  Row _cacheInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.moneyBill,color: Colors.grey,size: 15,),
            SizedBox(width: 10,),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'اعتبار :  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '150000',
                  style: TextStyle(
                    color: kThirdColor,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' تومان ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
            ),
          ],
        ),
        RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          child: Text('افزایش اعتیار'),
          onPressed: (){},
        )
      ],
    );
  }
}

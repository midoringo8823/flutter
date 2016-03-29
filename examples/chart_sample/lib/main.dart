// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'chart/chart.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Chart test',
    routes: <String, WidgetBuilder> {
      '/': (BuildContext context) => new ChartSample()
    }
  ));
}

class ChartSample extends StatefulWidget {
  @override
  State createState() => new ChartSampleState();
}

class ChartSampleState extends State<ChartSample> {
  ChartData data;
  Chart chart;
  bool get enableRemoveRow => (data.rows.length > 1);
  bool get enableAddRow => (data.rows.length < dataSource.length);
  bool get enableRemoveColumn => (data.columns.length > 1);
  bool get enableAddColumn => (data.columns.length < columnSource.length);
  Widget _buildChartControl() {
    return new Column(
        children: [
          new Row(
            children: [
              new RaisedButton(
                child: new Text('Add Row'),
                onPressed: enableAddRow ? _onAddRow : null
              ),
              new RaisedButton(
                child: new Text('Add Column'),
                onPressed: enableAddColumn ? _onAddColumn : null
              )
            ]
          ),
          new Row(
            children: [
              new RaisedButton(
                child: new Text('Remove Row'),
                onPressed: enableRemoveRow ? _onRemoveRow : null
              ),
              new RaisedButton(
                child: new Text('Remove Column'),
                onPressed: enableRemoveColumn ? _onRemoveColumn : null
              )
            ]
          ),
          new Flexible(child: chart)
        ]
      );
  }

  Widget build(BuildContext context) {
    if (data == null) {
      data = _buildChartData();
    }
    chart = new Chart(data: data);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sample Chart')
      ),
      body: _buildChartControl()
    );
  }

  void _onAddRow() {
    setState(() {
      data.rows.add(dataSource[data.rows.length]);
    });
  }

  void _onAddColumn() {
    setState(() {
      data.columns.add(columnSource[data.columns.length]);
    });
  }

  void _onRemoveRow() {
    setState(() {
      data.rows.removeLast();
    });
  }

  void _onRemoveColumn() {
    setState(() {
      data.columns.removeLast();
    });
  }

  List dataSource = const [
      const [7.0,  23.0, 20.0],
      const [36.0,  19.0, 24.0],
      const [77.0, 46.0, 69.0],
      const [19.0,  13.0, 31.0],
      const [19.0,  33.0, 25.0],
      const [39.0,  23.0, 69.0],
      const [62.0,  54.0, 21.0],
      const [23.0,  43.0, 99.0],
      const [28.0,  33.0, 31.0],
  ];

  List columnSource = [
      new ChartColumnSpec(label: 'A'),
      new ChartColumnSpec(label: 'B'),
      new ChartColumnSpec(label: 'C')];

  var initialRowCount = 4;

  ChartData _buildChartData() {
    List rows = new List.from(
        dataSource.sublist(0, initialRowCount));

    /// Sample columns used by demos with quantitative dimension scale
    List columns = new List.from(columnSource);

    return new ChartData(rows: rows, columns: columns);
  }
}

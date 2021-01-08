import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String _label;
  final double _totalDailyAmount, _percentTotal;

  ChartBars(this._label, this._totalDailyAmount, this._percentTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '\$${_totalDailyAmount.toString()}',
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: _percentTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(_label),
      ],
    );
  }
}

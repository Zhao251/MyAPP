import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberPickerProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void setCount(int value) {
    _count = value;
    notifyListeners();
  }
}

class NumberPicker extends StatelessWidget {
  final ValueNotifier<int> valueNotifier;
  final void Function(int) onChanged;

  const NumberPicker({
    required this.valueNotifier,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    int count = valueNotifier.value;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0), // 设置圆角半径
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count > 0)
            GestureDetector(
              onTap: () {
                onChanged(count - 1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0), // 设置圆角半径
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
            ),
          if (count > 0) SizedBox(width: 16.0),
          if (count > 0)
            Text(
              count.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          if (count > 0) SizedBox(width: 16.0),
          GestureDetector(
            onTap: () {
              onChanged(count + 1);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径
              ),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

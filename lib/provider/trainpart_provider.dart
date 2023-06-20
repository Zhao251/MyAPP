import 'package:flutter/material.dart';

import '../component/trainmsg.dart';

class TrainpartProvider extends ChangeNotifier {
  Trainpart trainpart = Trainpart(
    starttime: '起始时间',
    startposition: '起始站',
    train: '车次',
    totaltime: '时长',
    endtime: '到达时间',
    endposition: '到达站',
  );

  void updateTrainpart(Trainpart newTrainpart) {
    trainpart = newTrainpart;
    notifyListeners();
  }
}

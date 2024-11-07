import 'package:dio/dio.dart';
import 'package:yes_no_app_fatima_h/domain/entities/message.dart';
import 'package:yes_no_app_fatima_h/infrastructure/models/yes_no_model.dart';

class GetYesNoanswer { 

  final _dio = Dio();
  Future<Messages> getAnswer() async { 

    final response = await _dio.get('https://yesno.wtf/api');

    final yesnomodel = YesNoModel.fromJsonMap(response.data);

    return yesnomodel.toMessageEntitie();

   }
 }
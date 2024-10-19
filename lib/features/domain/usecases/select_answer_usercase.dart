import 'package:quizer/features/data_sources/models/answer_model.dart';

class SelectAnswerUseCase
{


  bool call(AnswerModel answer)
      {
        if(answer.isRightAnswer!)
          {
            return true;
          }
        return false;
      }
}
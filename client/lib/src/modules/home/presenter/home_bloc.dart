import 'package:rxdart/subjects.dart';

class HomeBloc{

  int indexTelaAtual = 0;
  BehaviorSubject<int> _intexTelaStream = BehaviorSubject.seeded(0);

  Stream<int> get getIndexTela => _intexTelaStream.stream;

  void mudarTela(int indexNovaTela){
    if(indexNovaTela != indexTelaAtual || indexNovaTela == 0){
      indexTelaAtual = indexNovaTela;
      _intexTelaStream.sink.add(indexTelaAtual);
    }
  }

  void dispose(){
    _intexTelaStream.close();
  }

}
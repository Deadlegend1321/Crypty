
class Exchange{
   int _id;
   String _cryptocurrency;
   String _fiatcurrency;
   String _value;

  Exchange(
    this._cryptocurrency,
    this._fiatcurrency,
    this._value
  );

  Exchange.map(dynamic obj){
    this._id = obj['id'];
    this._cryptocurrency = obj['cryptocurrency'];
    this._fiatcurrency = obj['fiatcurrency'];
    this._value = obj['value'];
  }


  String get value => _value;

  String get fiatcurrency => _fiatcurrency;

  String get cryptocurrency => _cryptocurrency;

  int get id => _id;

  Map<String,dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["cryptocurrency"] = _cryptocurrency;
    map["fiatcurrency"] = _fiatcurrency;
    map["value"] = _value;
    if(id != null){
      map["id"] = _id;
    }
    return map;
  }
  Exchange.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._cryptocurrency = map['cryptocurrency'];
    this._fiatcurrency = map['fiatcurrency'];
    this._value = map['value'];
  }

}
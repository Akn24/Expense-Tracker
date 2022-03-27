import 'dart:convert';
import 'package:http/http.dart' as http;

class Network{
  Future<List<dynamic>> getStockList() async {
    var url = "https://expense-tracker-hackathon.herokuapp.com/api/v1/user/random/stock";
    final res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      final data = jsonDecode(res.body);
      return data;
    }
    else{
      return [];
    }
  }

  Future<List<dynamic>> getMutualList() async {
    var url = "https://expense-tracker-hackathon.herokuapp.com/api/v1/user/random/mf";
    final res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      final data = jsonDecode(res.body);
      return data;
    }
    else{
      return [];
    }
  }

  Future<List<dynamic>> getTransactions() async{
    var url = "https://expense-tracker-hackathon.herokuapp.com/api/v1/transactions";
    final res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      final data = jsonDecode(res.body);
      return data;
    }
    else{
      return [];
    }
  }

}
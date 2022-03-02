import 'package:belajar_getxx/model/nowPlaying.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiProvider {
  var url = "https://api.themoviedb.org/3";

  Future getNowPlaying() async {
    var urll = Uri.parse(
        url + '/movie/now_playing?api_key=067f4a5f7fcb45fb2c702f728367e3f2');
    try {
      final res = await http.get(urll).timeout(const Duration(seconds: 11));
      // print(res.body);
      if (res.statusCode == 200) {
        return NowplayingModel.fromJson(res.body);
      } else if (res.statusCode == 400) {
        return NowplayingModel.fromJson(res.body);
      } else {
        throw Exception('Failur Respon');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBLGjzFMmkQUqizxNJXrEOq5KqU4lXmxMc";
const ID_CANAL = "UCLXl1V6n82Dyg1VhVgSL0nw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    );

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;

      /*for(var video in dadosJson["items"]){
        print("Fusca: " + video.toString());
      }*/

      //print("resultado: " + response.body);
    }else{
      print("Resultado: " + response.statusCode.toString());
    }

  }

}
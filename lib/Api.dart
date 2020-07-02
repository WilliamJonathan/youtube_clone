import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyBHJthq16NfW1O4W3hsdvqqrKeGkZsNJS4";
const ID_CANAL = "UCLXl1V6n82Dyg1VhVgSL0nw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  pesquisar(String pesquisa) async{

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
      print("resultado: " + response.body);
    }else{

    }

  }

}
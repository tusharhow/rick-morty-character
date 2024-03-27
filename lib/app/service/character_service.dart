import 'package:dio/dio.dart';
import 'package:rick_morty_character/app/commons/constant/api_constant.dart';
import 'package:rick_morty_character/app/models/character.dart';

class CharacterService {
  final Dio _dio = Dio();

  Future<List<Character>> getCharacters() async {
    try {
      final response = await _dio.get(CHARACTER_URL);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<dynamic> products = data['results'];
        final map = products.map((json) => Character.fromJson(json)).toList();
        return map;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<Character> getCharacterById(int id) async {
    try {
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character/$id');
      if (response.statusCode == 200) {
        return Character.fromJson(response.data);
      } else {
        return Character();
      }
    } catch (e) {
      return Character();
    }
  }

  Future<List<Character>> getCharactersByPage(int page) async {
    try {
      final response = await _dio
          .get('https://rickandmortyapi.com/api/character/?page=$page');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<dynamic> products = data['results'];
        final map = products.map((json) => Character.fromJson(json)).toList();
        return map;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

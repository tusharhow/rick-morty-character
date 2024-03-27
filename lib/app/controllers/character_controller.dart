import 'package:flutter/material.dart';
import 'package:rick_morty_character/app/models/character.dart';
import 'package:rick_morty_character/app/service/character_service.dart';

class CharacterController extends ChangeNotifier {
  CharacterController() {
    getAllCharacters();
  }

  final CharacterService _characterService = CharacterService();

  Future<List<Character>> getAllCharacters() async {
    final characters = await _characterService.getCharacters();
    return characters;
  }

  Future<Character> getCharacterById(int id) async {
    final character = await _characterService.getCharacterById(id);
    return character;
  }

  Future<List<Character>> getCharactersByPage(int page) async {
    final characters = await _characterService.getCharactersByPage(page);
    return characters;
  }
}

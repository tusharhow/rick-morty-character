import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_character/app/controllers/character_controller.dart';
import 'package:rick_morty_character/app/models/character.dart';
import 'package:rick_morty_character/app/widgets/character_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
      ),
      body: Consumer<CharacterController>(
        builder: (context, state, _) {
          return FutureBuilder<List<Character?>>(
              future: state.getAllCharacters(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final characters = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: characters!.length,
                      itemBuilder: (context, index) {
                        final character = characters[index];
                        return CharacterItem(character: character);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No data found'),
                    );
                  }
                } else {
                  return const Center(
                    child: Text('Error fetching data'),
                  );
                }
              });
        },
      ),
    );
  }
}

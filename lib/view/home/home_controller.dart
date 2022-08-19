import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controller/routes.dart';
import 'package:pokedex/helper.dart';
import 'package:pokedex/model/pokemon_basic_information.dart';
import 'package:pokedex/services/pokedex_service.dart';
import 'package:pokedex/styles/style.dart';
import 'package:pokedex/widget/alertdlg.dart';
import 'package:pokedex/widget/chipstype.dart';

class HomeController extends ChangeNotifier {
  static const _limitPokemonPerPage = 5;

  final List<Widget> _listPokemons = [];
  bool _loading = false;
  bool _loadingMore = false;

  late BuildContext _context;
  final _service = PokedexService();
  final _helper = Helper();
  final _ctrlInputIdName = TextEditingController();
  final _styles = Styles();

  List<Widget> get listPokemons => _listPokemons;
  bool get loading => _loading;
  bool get loadingMore => _loadingMore;
  TextEditingController get ctrlInputIdName => _ctrlInputIdName;

  void create({required BuildContext context}) {
    _context = context;
    search();
  }

  void search({bool nextPage = false}) async {
    _helper.unfocus(context: _context);

    if (nextPage) {
      _loadingMore = true;
    } else {
      _loading = true;
      _listPokemons.clear();
    }

    notifyListeners();
    List<PokemonBasicInformation> pokemonsList = [];

    if (_ctrlInputIdName.text.isEmpty) {
      int nextIdPokemon = _listPokemons.length;

      for (var i = 1; i <= _limitPokemonPerPage; i++) {
        nextIdPokemon++;

        await _service
            .pokemonSimpleInfo(idNamePokemon: nextIdPokemon.toString())
            .then((resp) async {
          if (resp.statusCode == 200) {
            pokemonsList.add(
              PokemonBasicInformation.fromJson(json.decode(resp.body)),
            );
          }
        });

        if (i == _limitPokemonPerPage) {
          _buildListPokemons(pokemons: pokemonsList);
          _defaultValues();
        }
      }
    } else {
      _service
          .pokemonSimpleInfo(idNamePokemon: _ctrlInputIdName.text)
          .then((resp) {
        if (resp.statusCode == 200) {
          pokemonsList.add(
            PokemonBasicInformation.fromJson(json.decode(resp.body)),
          );

          _buildListPokemons(pokemons: pokemonsList);
          _defaultValues();
        } else {
          _defaultValues();

          AlertDlg().showWarning(
            title: 'Oooopss..',
            body: 'Nenhum pokémon encontrado',
            context: _context,
          );
        }
      });
    }
  }

  void _defaultValues() {
    _loadingMore = false;
    _loading = false;
    notifyListeners();
  }

  void _buildListPokemons({
    required List<PokemonBasicInformation> pokemons,
  }) async {
    for (var pokemon in pokemons) {
      List<Widget> chipsTypes = [];

      ChipsType chipsTypecolor = ChipsType();

      for (var type in pokemon.types) {
        chipsTypes.add(
          chipsTypecolor.create(type: type.type.name),
        );
      }

      _listPokemons.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            decoration: _styles.cardBase(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: pokemon.sprites.frontDefault,
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(_context).size.height - 390),
                            child: Text(
                              pokemon.name,
                              style: _styles.namePokemonSimple(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              _context,
                              Routes.routeDetails,
                              arguments: {'id': pokemon.id},
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 22,
                              color: _styles.colorPrimary(),
                            ),
                          ),
                        )
                      ]),
                  subtitle: Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 10, right: 15),
                  child: Wrap(
                    spacing: 3,
                    runSpacing: 5,
                    children: chipsTypes,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

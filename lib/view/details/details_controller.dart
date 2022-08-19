import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/helper.dart';
import 'package:pokedex/model/pokemon_details.dart';
import 'package:pokedex/services/pokedex_service.dart';
import 'package:pokedex/styles/style.dart';
import 'package:pokedex/widget/alertdlg.dart';
import 'package:pokedex/widget/chipstype.dart';
import 'package:pokedex/widget/textinfo.dart';
import '../../controller/routes.dart';

class DetailsController extends ChangeNotifier {
  final _style = Styles();
  late BuildContext _context;
  final _service = PokedexService();
  final _styleColors = PokemonInfoColorStyles();
  final _helper = Helper();

  Widget _header = Container();
  Widget _body = Container();

  bool _loading = false;

  bool get loading => _loading;
  Widget get header => _header;
  Widget get body => _body;

  void createProvider({required BuildContext context, required int idPokemon}) {
    _context = context;
    _getDetails(idPokemon: idPokemon);
  }

  void _returnHome() {
    Navigator.pushNamed(_context, Routes.routeHome);
  }

  void _getDetails({required int idPokemon}) {
    _loading = true;
    notifyListeners();

    _service.pokemonDetails(idPokemon: idPokemon).then((resp) {
      if (resp.statusCode == 200) {
        _buildHeader(details: PokemonDetails.fromJson(json.decode(resp.body)));
      } else {
        AlertDlg()
            .showWarning(
              title: 'Oooopss..',
              body: 'Detalhes do pokémon não encontrado',
              context: _context,
            )
            .then((_) => _returnHome);
      }
    });
  }

  void _buildHeader({required PokemonDetails details}) {
    _styleColors.getType(type: details.types[0].type.name);

    _header = Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: _styleColors.background,
      ),
      height: 335,
      child: Column(
        children: [
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: _returnHome,
              icon: Icon(
                Icons.chevron_left,
                color: _styleColors.backgroundAvatar,
              ),
            ),
          ),
          Text(
            details.name,
            style: _style.namePokemonDetails(),
            textAlign: TextAlign.center,
          ),
          Text(
            '#${details.id.toString().padLeft(3, '0')}',
            style: _style.idPokemonDetails(),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Hero(
              tag: details.name,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl:
                    'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/${details.id.toString().padLeft(3, '0')}.png',
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );

    _builderBody(details: details);
  }

  void _builderBody({required PokemonDetails details}) async {
    List<Widget> chipsTypes = [];
    ChipsType chipsTypecolor = ChipsType();

    for (var type in details.types) {
      chipsTypes.add(
        chipsTypecolor.create(type: type.type.name),
      );
    }

    _body = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildHeaderTitle(tittle: 'Tipo'),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                spacing: 3,
                runSpacing: 5,
                children: chipsTypes,
              ),
            ),
          ),
          const SizedBox(height: 15),
          _buildHeaderTitle(tittle: 'Informações'),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 12),
            child: Column(
              children: [
                TextInfo(
                  title: 'Altura: ',
                  value:
                      '${_helper.decimeterToCentimeter(value: details.height)} cm',
                ),
                const SizedBox(height: 5),
                TextInfo(
                  title: 'Peso: ',
                  value: '${_helper.hectogramsToKg(value: details.weight)} Kg',
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          _buildHeaderTitle(tittle: 'Habilidades'),
          _buildAbilities(abilities: details.abilities),
          const SizedBox(height: 15),
          _buildHeaderTitle(tittle: 'Estatísticas'),
          _buildStats(stats: details.stats),
          const SizedBox(height: 25),
        ],
      ),
    );

    //apenas para ver o loading mesmo :D
    await Future.delayed(const Duration(seconds: 1));

    _loading = false;
    notifyListeners();
  }

  _buildHeaderTitle({required String tittle}) {
    return Container(
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '  $tittle:',
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  _buildAbilities({required List<AbilityElement> abilities}) {
    List<Widget> list = [];

    for (var ability in abilities) {
      list.add(TextInfo(
        title: '• ',
        value: ability.ability.name,
      ));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 12),
      child: Column(
        children: list,
      ),
    );
  }

  _buildStats({required List<StatElement> stats}) {
    List<Widget> list = [];

    for (var statistic in stats) {
      list.add(
        TextInfo(
          title: '${statistic.stat.name}: ',
          value: statistic.baseStat.toString(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 12),
      child: Column(
        children: list,
      ),
    );
  }
}

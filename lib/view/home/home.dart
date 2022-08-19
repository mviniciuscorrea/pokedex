import 'package:flutter/material.dart';
import 'package:pokedex/styles/style.dart';
import 'package:pokedex/view/home/home_controller.dart';
import 'package:pokedex/widget/button.dart';
import 'package:pokedex/widget/input.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController _homeCtrl;
  final _style = Styles();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeCtrl.create(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeController>(
        create: (context) => HomeController(),
        child: Builder(
          builder: (context) {
            _homeCtrl = context.read<HomeController>();

            return Column(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: _style.colorPrimary(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Input().insertInputRequired(
                          context: context,
                          controller: _homeCtrl.ctrlInputIdName,
                          label: 'Pokémon',
                        ),
                        const SizedBox(height: 15),
                        Consumer<HomeController>(
                          builder: (context, provider, child) {
                            return _homeCtrl.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Button(
                                    onPressed: _homeCtrl.search,
                                    text: 'Pesquisar',
                                    icon: Icons.search,
                                  );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Consumer<HomeController>(
                  builder: (context, provider, child) {
                    return Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: provider.listPokemons,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 8, left: 16, right: 16),
                                    child: Consumer<HomeController>(
                                        builder: (context, provider, child) {
                                      return provider.loadingMore
                                          ? const Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 20,
                                                top: 6,
                                              ),
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : Visibility(
                                              visible:
                                                  provider.listPokemons.length >
                                                      1,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          provider.search(
                                                              nextPage: true),
                                                      child: Text(
                                                          'Carregar mais...',
                                                          style: TextStyle(
                                                            color: _style
                                                                .colorSecondary(),
                                                          )),
                                                    )
                                                  ]));
                                    }))
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

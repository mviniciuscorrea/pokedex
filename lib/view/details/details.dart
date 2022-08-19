import 'package:flutter/material.dart';
import 'package:pokedex/view/details/details_controller.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final int idPokemon;

  const Details({Key? key, required this.idPokemon}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late DetailsController _detailsCrtl;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _detailsCrtl.createProvider(
        context: context,
        idPokemon: widget.idPokemon,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<DetailsController>(
        create: (context) => DetailsController(),
        child: Builder(
          builder: (context) {
            _detailsCrtl = context.read<DetailsController>();

            return Consumer<DetailsController>(
              builder: (context, provider, child) {
                return provider.loading
                    ? Center(
                        child: Image.asset(
                          "assets/images/loading.gif",
                          height: 125.0,
                          width: 125.0,
                        ),
                      )
                    : Column(children: [
                        provider.header,
                        Expanded(
                            child: SingleChildScrollView(
                          child: provider.body,
                        )),
                      ]);
              },
            );
          },
        ),
      ),
    );
  }
}

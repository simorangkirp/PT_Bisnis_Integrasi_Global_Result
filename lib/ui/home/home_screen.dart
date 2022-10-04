// ignore_for_file: prefer_const_constructors

import 'package:big_test/bloc/bloc/home_bloc.dart';
import 'package:big_test/bloc/event/home_event.dart';
import 'package:big_test/bloc/state/home_state.dart';
import 'package:big_test/helper/app_scale.dart';
import 'package:big_test/model/card_model.dart';
import 'package:big_test/ui/home/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc()
                ..add(
                  InitHome(10, 1),
                ),
            ),
          ],
          child: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bloc(HomeEvent event) => BlocProvider.of<HomeBloc>(context).add(event);
  List<CardData> listCardModel = [];
  bool shouldLoadMore = true;
  int limit = 10;
  int offset = 1;

  ScrollController sContrl = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
    sContrl.addListener(() {
      if (sContrl.position.pixels >= sContrl.position.maxScrollExtent) {
        if (shouldLoadMore) {
          limit = limit + 10;
          offset = offset + 10;
          bloc(InitHome(limit, offset));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onDetailAction(CardData value) {
      bloc(ToDetailScreen(
        orderId: value.idOrder ?? 0,
      ));
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {}
            if (state is DetailLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ItemDetails(model: state.model);
                  },
                ),
              );
            }
            if (state is HomeDataLoaded) {
              listCardModel.addAll(state.model);
              shouldLoadMore = state.model.isNotEmpty;
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xff00209D),
                      ),
                    ),
                    constraints: const BoxConstraints(
                      maxHeight: 52,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Tulis Email/No. Handphone',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xff00209D),
                        ),
                        height: 52,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                          child: Text(
                            'Cari',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.scaleFont(
                                16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: listCardModel.isNotEmpty ? listCardModel.length : 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    if (listCardModel.isEmpty) {
                      return SizedBox();
                    } else {
                      return ItemsCard(
                        model: listCardModel[i],
                        onDetail: (value) {
                          onDetailAction(value);
                        },
                      );
                    }
                  },
                );
              },
            ),
            // ...List<Widget>.generate(
            //   listCardModel.length,
            //   (i) {
            //     return ItemsCard(model: listCardModel[i]);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

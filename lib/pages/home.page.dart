import 'package:flutter/material.dart';
import 'package:ironman_suits_app/data/suits.data.dart';
import 'package:ironman_suits_app/models/suit_model.dart';
import 'package:ironman_suits_app/pages/detail_suit.page.dart';
import 'package:ironman_suits_app/widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Suit> data;

  @override
  void initState() {
    data = SuitsData().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'IronMan',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Suits',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final suit = data[index];
                    return GestureDetector(
                      child: Hero(
                        tag: suit.name,
                        child: CardWidget(suit: suit),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(suit: suit),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

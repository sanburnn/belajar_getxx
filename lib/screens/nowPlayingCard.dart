import 'package:belajar_getxx/model/nowPlaying.dart';
import 'package:flutter/material.dart';

class NowPlayingCard extends StatelessWidget {
  final NowplayingModel model;
  const NowPlayingCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 3),
          )
        ]),
        height: 260,
        width: 180,
        child: Column(
          children: [
            Container(
                height: 200,
                width: 180,
                child: Image(
                  image: AssetImage('assets/images/profile.png'),
                  fit: BoxFit.cover,
                )),
            Text(
              '152415',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Ngabrut',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              'December',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

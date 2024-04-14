import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wk13/phone.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.title,
    required this.phone,
  }) : super(key: key);
  final String title;
  final Phone phone;

  @override
  State<StatefulWidget> createState() =>
      _DetailScreenState(title: title, phone: phone);
}

class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState({required this.title, required this.phone});
  final String title;
  final Phone phone;
  bool _size = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(phone.brand)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: _size ? 0 : 3,
              duration: const Duration(seconds: 1),
              child: AnimatedOpacity(
                opacity: _size ? .25 : 1,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  width: _size ? 200 : 600,
                  height: _size ? 100 : 400,
                  alignment: _size ? Alignment.topRight : Alignment.bottomRight,
                  duration: const Duration(seconds: 1),
                  child: Hero(
                    tag: phone.photo,
                    child: Image(
                      image: AssetImage(
                        "images/${phone.photo}",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(phone.brand),
            Text(phone.description),
            ElevatedButton(
                onPressed: () => setState(() {
                      _size = !_size;
                    }),
                child: const Text('Scale!'))
          ],
        ));
  }
}

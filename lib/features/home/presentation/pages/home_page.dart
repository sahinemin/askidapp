import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.userEntity, super.key});
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
      ),
      body: const Text('Emin'),
    );
  }
}

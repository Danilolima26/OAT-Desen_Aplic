import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Game {
  final String nome;
  final int anoLancamento;
  final String plataforma;
  final String imagePath;

  Game(
      {required this.nome,
      required this.anoLancamento,
      required this.imagePath,
      required this.plataforma});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radical Games',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimeiraTela(),
    );
  }
}

class PrimeiraTela extends StatelessWidget {
  final List<Game> jogos = [
    Game(
        nome: 'Castlevania ',
        anoLancamento: 2020,
        plataforma: 'PC',
        imagePath: 'assets/images/Castlevania.jpg'),
    Game(
        nome: 'Crash Bandicoot',
        anoLancamento: 2018,
        plataforma: 'PlayStation 4',
        imagePath: 'assets/images/Crash Bandicoot.jpg'),
    Game(
        nome: 'Sonic Mania',
        anoLancamento: 1990,
        plataforma: 'Master System',
        imagePath: 'assets/images/Sonic Mania.jpg'),
    Game(
        nome: 'Donkey Kong Country',
        anoLancamento: 2019,
        plataforma: 'Nintendo Switch',
        imagePath: 'assets/images/Donkey Kong Country.jpg'),
    Game(
        nome: 'Mega Man Legacy Collection',
        anoLancamento: 2022,
        plataforma: 'PC',
        imagePath: 'assets/images/Mega Man Legacy Collection.jpg'),
    Game(
        nome: 'RayMan Legends',
        anoLancamento: 2017,
        plataforma: 'PC',
        imagePath: 'assets/images/RayMan Legends.jpg'),
    Game(
        nome: 'Super Metroid',
        anoLancamento: 2000,
        plataforma: 'PlayStation',
        imagePath: 'assets/images/Super Metroid.jpg'),
    Game(
        nome: 'Super Mario',
        anoLancamento: 1985,
        plataforma: 'Nintendo',
        imagePath: 'assets/images/Super Mario.jpg'),
    Game(
        nome: 'Shantae and the Pirate',
        anoLancamento: 2021,
        plataforma: 'PC',
        imagePath: 'assets/images/Shantae and the Pirate.jpg'),
    Game(
        nome: 'Pokemon',
        anoLancamento: 2019,
        plataforma: 'Android',
        imagePath: 'assets/images/Pokemon.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Jogos'),
      ),
      body: ListView.builder(
        itemCount: jogos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(jogos[index].imagePath),
            ),
            title: Text(jogos[index].nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SegundaTela(jogo: jogos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
// Lucão 
class SegundaTela extends StatelessWidget {
  final Game jogo;

  SegundaTela({required this.jogo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Jogo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${jogo.nome}'),
            Text('Ano de lançamento: ${jogo.anoLancamento}'),
            Text('Plataforma: ${jogo.plataforma}'),
            SizedBox(height: 16.0),
            Expanded(
              child: Center(
                child: Image(
                  image: AssetImage(jogo.imagePath),
                  fit: BoxFit.contain,
                  height: 200.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Voltar para a Primeira Tela'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

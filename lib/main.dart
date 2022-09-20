import 'package:flutter/material.dart';
import 'package:flutter_moda_app/detay.dart';

void main() => runApp(const ModaApp());

class ModaApp extends StatelessWidget {
  const ModaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  late TabController myTabController;

  @override
  void initState() {
    super.initState();
    myTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    myTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.brown,
          controller: myTabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.more,
                color: Colors.grey,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.grey,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.navigation,
                color: Colors.grey,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.grey,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Fashion App',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            color: Colors.grey,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          profilListesi(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 12,
              //color: Colors.blue.shade300,
              child: Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: const DecorationImage(
                              image: AssetImage('assets/model1.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: const Text(
                        'Daisy',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('34 mins ago'),
                      trailing: const Icon(Icons.more_vert),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                      child: Text(
                          'This offical website features a ribbet knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends.',
                          style: TextStyle(color: Colors.grey.shade700)),
                    ),
                    images(context),
                    const SizedBox(
                      height: 10,
                    ),
                    hashtags(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    likeComments(context)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding likeComments(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Icon(
            Icons.reply,
            color: Colors.brown.withOpacity(0.4),
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            '1.7k',
            style: TextStyle(color: Colors.grey, fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            width: 40,
          ),
          Icon(
            Icons.comment,
            color: Colors.brown.withOpacity(0.4),
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            '325',
            style: TextStyle(color: Colors.grey, fontFamily: 'Montserrat'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 215,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '2.3k',
                  style:
                      TextStyle(color: Colors.grey, fontFamily: 'Montserrat'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding hashtags() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.brown.withOpacity(0.2),
            ),
            child: const Center(
              child: Text(
                '# LouisVuitton',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    color: Colors.brown),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 25,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.brown.withOpacity(0.2),
            ),
            child: const Center(
              child: Text(
                '# Chloe',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    color: Colors.brown),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row images(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Detay(img: 'assets/modelgrid1.jpeg'),
              ));
            },
            child: Hero(
              tag: 'assets/modelgrid1.jpeg',
              child: Container(
                height: 200,
                width: (MediaQuery.of(context).size.width - 50) / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/modelgrid1.jpeg',
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Detay(img: 'assets/modelgrid2.jpeg'),
                  ));
                },
                child: Hero(
                  tag: 'assets/modelgrid2.jpeg',
                  child: Container(
                    height: 95,
                    width: (MediaQuery.of(context).size.width - 100) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/modelgrid2.jpeg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Detay(img: 'assets/modelgrid3.jpeg'),
                  ));
                },
                child: Hero(
                  tag: 'assets/modelgrid3.jpeg',
                  child: Container(
                    height: 100,
                    width: (MediaQuery.of(context).size.width - 100) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/modelgrid3.jpeg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  SizedBox profilListesi() {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        children: [
          listeElemani('assets/model1.jpeg', 'assets/chanellogo.jpg'),
          const SizedBox(
            width: 30,
          ),
          listeElemani('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
          const SizedBox(
            width: 30,
          ),
          listeElemani('assets/model3.jpeg', 'assets/chloelogo.png'),
          const SizedBox(
            width: 30,
          ),
          listeElemani('assets/model1.jpeg', 'assets/chanellogo.jpg'),
          const SizedBox(
            width: 30,
          ),
          listeElemani('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
          const SizedBox(
            width: 30,
          ),
          listeElemani('assets/model3.jpeg', 'assets/chloelogo.png'),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  listeElemani(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(logoPath), fit: BoxFit.cover)),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.brown,
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: const Center(
                child: Text(
                  'Follow',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Colors.white),
                ),
              )),
        )
      ],
    );
  }
}

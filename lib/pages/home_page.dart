import 'package:flutter/material.dart';
import 'package:flutter_avancando/data/save_local.dart';
import 'package:flutter_avancando/pages/articles_page.dart';
// import 'package:flutter_avancando/pages/articles_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final feedController = TextEditingController();
  List feeds = [
    'https://blog.schoolofnet.com/feed/'
  ];

  @override
  Widget build(BuildContext context) {
    SaveLocal persistencia = new SaveLocal(feedList: feeds);
    persistencia.read().then((data) {
      setState(() {
        feeds = data;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Artigos'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
        key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: feeds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(feeds[index]),
                      leading: Icon(Icons.rss_feed),
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => ArticlePage(feeds[index])
                          )
                        );
                        print(index);
                      },
                    );
                  }
                )
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                controller: feedController,
                decoration: InputDecoration(
                  labelText: "Link do rss"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo vazio";
                  }
                },
              ),
              RaisedButton(
                child: Text('Cadastrar'),
                color: Colors.amber,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      feeds.add(feedController.text);
                      feedController.text = "";
                      persistencia.save(feeds);
                      print(feedController.text);
                    });
                  }
                }
              )
            ],
          ),
        ),
      )
    );
  }
}

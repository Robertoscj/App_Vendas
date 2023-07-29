import 'package:flutter/material.dart';

class Layout {
  static int currItem = 0;
  static final pages = [
    HomePage.tag,
    SobrePage.tag,
    SobrePage.tag,
  ];

  static TextEditingController _c = TextEditingController();
  static Scaffold getContent(BuildContext context, content,
      [bool menu = true]) {
    BottomNavigationBar bottomNavBar = BottomNavigationBar(
      currentIndex: currItem,
      //fixedColor: primary(),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.question_answer), title: Text('Sobre')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Configurações'))
      ],
      onTap: (int i) {
        currItem = i;
        Navigator.of(context).pushReplacementNamed(pages[i]);
      },
    );

    if (!menu) {
      currItem = 1;
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Layout.primary(),
          title: Center(
            child: Text('Lista de Vendas'),
          ),
          actions: _getActions(context)),
      bottomNavigationBar: menu ? bottomNavBar : null,
      body: content,
    );
  }

  static List<Widget> _getActions(context) {
    List<Widget> items = List<Widget>();
    if (pages[currItem] != HomePage.tag) {
      return items;
    }
    items.add(
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext ctx) {
                final input = TextFormField(
                    controller: _c,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: 'Produto',
                        contentPadding: (EdgeInsets.fromLTRB(20, 10, 20, 10))));
                return AlertDialog(
                    title: Text('Nova Venda'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[input],
                      ),
                    ),
                    actions: <Widget>[
                      RaisedButton(
                          color: primaryDark(),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Layout.light()),
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          }),
                      RaisedButton(
                          color: primary(),
                          child: Text(
                            'Adicionar',
                            style: TextStyle(color: Layout.light()),
                          ),
                          onPressed: () {
                            ModelVenda venda = ModelVenda();
                            venda.insert({
                              'cliente': _c.text,
                              'data': DateTime.now().toString()
                            }).then((novaLinha) {
                              Navigator.of(ctx).pop();
                              Navigator.of(ctx)
                                  .pushReplacementNamed(HomePage.tag);
                            });

                            Navigator.of(ctx).popAndPushNamed(HomePage.tag);

                            //print(_c.text);
                          }),
                    ]);
              });
        },
        child: Icon(Icons.add),
      ),
    );
    items.add(Padding(padding: EdgeInsets.only(right: 20)));
    return items;
  }

  static Color primary([double opacity = 1]) =>
      Colors.green[700].withOpacity(opacity);
  static Color primaryDark([double opacity = 1]) =>
      Color(0xff165a0c).withOpacity(opacity);
  static Color primaryLight([double opacity = 1]) =>
      Color(0xff6adf59).withOpacity(opacity);

  static Color secondary([double opacity = 1]) =>
      Colors.teal[700].withOpacity(opacity);
  static Color secondaryDark([double opacity = 1]) =>
      Color(0xff004c40).withOpacity(opacity);
  static Color secondaryLight([double opacity = 1]) =>
      Color(0xff48a999).withOpacity(opacity);

  static Color light([double opacity = 1]) =>
      Color.fromRGBO(242, 234, 228, opacity);
  static Color dark([double opacity = 1]) =>
      Color.fromRGBO(51, 51, 51, opacity);

  static Color danger([double opacity = 1]) =>
      Color.fromRGBO(217, 74, 74, opacity);
  static Color success([double opacity = 1]) =>
      Color.fromRGBO(5, 100, 50, opacity);
  static Color info([double opacity = 1]) =>
      Color.fromRGBO(100, 150, 255, opacity);
  static Color warning([double opacity = 1]) =>
      Color.fromRGBO(166, 134, 0, opacity);
}

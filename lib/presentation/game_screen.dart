import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Color color1 = Colors.black12;
  Color color2 = Colors.black12;
  Color draggableColor1 = Colors.green;
  Color draggableColor2 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final showDraggable1 = color1 == Colors.black12;
    final showDraggable2 = color2 == Colors.black12;

    return Scaffold(
      appBar: AppBar(
        title: Text('Game Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DragTarget<Color>(
                key: Key('1'),
                onAccept: (data) {
                  if (data == draggableColor1) {
                    setState(() => color1 = data);
                  }
                },
                builder: (context, _, __) => Container(
                  color: color1,
                  width: 130,
                  height: 130,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              DragTarget<Color>(
                key: Key('2'),
                onAccept: (data) {
                  if (data == draggableColor2) {
                    setState(() => color2 = data);
                  }
                },
                builder: (context, _, __) => Container(
                  color: color2,
                  width: 130,
                  height: 130,
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IgnorePointer(
                ignoring: !showDraggable1,
                child: Opacity(
                  opacity: showDraggable1 ? 1 : 0,
                  child: Draggable<Color>(
                    key: Key('1'),
                    data: draggableColor1,
                    child: Container(
                      color: draggableColor1,
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    feedback: Container(
                      color: draggableColor1.withOpacity(0.5),
                      width: 85,
                      height: 85,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      color: Colors.white,
                      width: 85,
                      height: 85,
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: !showDraggable2,
                child: Opacity(
                  opacity: showDraggable2 ? 1 : 0,
                  child: Draggable<Color>(
                    key: Key('2'),
                    data: draggableColor2,
                    child: Container(
                      color: draggableColor2,
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    feedback: Container(
                      color: draggableColor2.withOpacity(0.5),
                      width: 85,
                      height: 85,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      color: Colors.white,
                      width: 85,
                      height: 85,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                color1 = Colors.black12;
                color2 = Colors.black12;
              });
            },
            child: Text('Reset Colors'),
          ),
        ],
      ),
    );
  }
}

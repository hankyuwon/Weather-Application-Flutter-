import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: FirstScreenWidget(),
    );
  }
}

class FirstScreenWidget extends StatelessWidget {
  const FirstScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 올라와도 배경이 밀리지 않음
        appBar: AppBar(
          centerTitle: true,
          title: Text('Weather App'),
          backgroundColor: Colors.indigoAccent
        ),
        body: Container(
          height:MediaQuery.of(context).size.height,//Container를 핸드폰 사이즈로 지정
            width:MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
            image:DecorationImage(
                fit:BoxFit.cover,
              image:AssetImage('imgs/weather.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop), // 투명도
            ), // 사진 전체화면 맞춰줌
          ),
            padding: EdgeInsets.fromLTRB(20,120,20,120),
            child: Column(
                children:<Widget>[
                  SizedBox(height: 45.0),
                  TextFormField(
                      decoration:InputDecoration(
                        hintText:'City name',
                      )
                  ),
                  SizedBox(height:10.0),
                  TextButton(
                    onPressed:(){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreenWidget()),
                    );},
                    child:Text("Check")
                  )
                ]
            )
        )
    );
  }
}


class SecondScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
              centerTitle: true,
              title: Text('Weather App'),
              backgroundColor: Colors.indigoAccent
          ),
          body: Column(children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 220,
                  height: 340,
                  color: Colors.indigoAccent,
                  margin: const EdgeInsets.all(8.0),
                ),
                Container(
                  width: 112,
                  height: 340,
                  color: Colors.indigoAccent,
                  margin: const EdgeInsets.all(4.0),
                  child: Center(
                    child:TextButton(
                        onPressed:(){Navigator.pop(context);},
                        child:Text("뒤로가기")
                    )
                  )
                )
              ],
            ),
            Container(
              width: 345,
              height: 290,
              color: Colors.white70,
            )
          ])),
    );
  }
}
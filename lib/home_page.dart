import 'package:flutter/material.dart';
import 'package:flutter_speedometer/arc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final TextEditingController _controller = TextEditingController();
 Offset _offset = const Offset(53, 35);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedometer"),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(15.0),
              child: TextField(controller: _controller,
                onSubmitted: (value) {
                  if(_controller.text == ""){
                    return;
                  }
                  setState(() {
                try{
                int value = int.parse(_controller.text);
                 _offset = offsetValue(value);
                }catch(error){
                  _controller.clear();
                  return;
                }
                
              });
                  _controller.clear();
      
                },
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_controller.text == ""){
                    return;
                  }
              setState(() {
                try{
                int value = int.parse(_controller.text);
                 _offset = offsetValue(value);
                }catch(error){
                  _controller.clear();
                  return;
                }});
              _controller.clear();
            }, child:  const Text("Enter a number")),
            const SizedBox(height: 50,),
              ArcView(diameter: 100,offset:_offset),
            
        ],


      ),
    );
  }

  Offset offsetValue(int value){
    Offset offset = const Offset(53, 35);
            if(value<=5){
                offset = const Offset(-25,100);
                }else if(value>5&&value<10){
                  offset = const Offset(-20, 80);
                }else if(value==10){
                  offset = const Offset(-20, 60);
                }
                else if(value>10&&value<15){
                  offset = const Offset(-5, 45);
                }else if(value ==15){
                  offset = const Offset(10, 40);
                }else if(value>15&&value<20){
                  offset = const Offset(35, 35);
                }else if(value==20){
                  offset = const Offset(53, 35);
                }else if(value>20&&value<25){
                  offset = const Offset(70, 40);
                }else if(value==25){
                  offset = const Offset(85, 45);
                }else if(value>25&&value<30){
                  offset = const Offset(100, 50);
                }else if(value==30){
                  offset = const Offset(110, 70);
                }else if(value>30&&value<35){
                  offset = const Offset(120, 80);
                }else if(value>=35){
                  offset = const Offset(120, 100);
                }
                return offset;
                
  }
}

  
import 'package:sound_chat/api/all%20_orders.dart';
import 'package:sound_chat/common/index.dart';

import 'Orderdeatail.dart';
class AllOrderlist extends StatefulWidget {
  @override
  _AllOrderlistState createState() => _AllOrderlistState();
}

class _AllOrderlistState extends State<AllOrderlist> {
  bool play = true;
  dynamic data;
  var superherosLength;
  String email;
  String name ;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(Provider.of<AllorderResponse>(context, listen: false).data!=null)
      data = Provider.of<AllorderResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(extendBody: false,
            backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(0xFFE18D13),
                backwardsCompatibility: true,
              ),
            body: ListView.builder(itemCount: data.length,itemBuilder: (context, index){
              return Card(color: Color(0xFF252525),
               child: ListTile(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Orderdeatail(data[index])));
              },
                title: Text("Order Sucess Id  "+data[index]['order_id'].toString(),style: TextStyle(color: Color(0xFFA39597)),),
                subtitle: Text(data[index]['createdAt'].toString(),style: TextStyle(color: Color(0xFFA39597))),
                leading: Icon(Icons.circle,color: Colors.red,),
                trailing: Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFFA39597),),
              ),

              );
            })
          ),
         Positioned(
           top: AppBar().preferredSize.height*0.1,
           left: width * 0.39865,
           child: SizedBox(
             height: height * 0.11168,
             width: width * 0.20875,
             child: Image.asset(
               'assets/soundpic.png',
             ),
           ),
         ),
        ],
      ),
    );
  }
}

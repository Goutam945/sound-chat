import 'package:sound_chat/api/search_api.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/ShopProductdetails.dart';
class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _search = TextEditingController();
//  final void Function(String) onTextChange;
//  SearchBar({ this.onTextChange });
  var product;
  var post;
  @override
  Widget build(BuildContext context) {
    if (Provider.of<SearchResponse>(context, listen: false).data != null)
     {
       product =Provider.of<SearchResponse>(context, listen: false).data['data']['product'];
        post =Provider.of<SearchResponse>(context, listen: false).data['data']['post'];
        print(product.length);
     }
    return SafeArea(child:
      Scaffold(appBar: AppBar( backgroundColor: Color(0xFFE18D13),title: TextFormField(style: TextStyle(color: Colors.white),
              controller: _search,
              // onChanged: onTextChange,
              decoration: InputDecoration(
                  //fillColor: Colors.black.withOpacity(0.1),
                 // filled: true,
                  suffixIcon: IconButton(icon: Icon(Icons.search),color: Colors.white,onPressed: (){
                    createSearchState(_search.text,context);
                  }),
                  hintText: 'Search something ...',hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero
              )
          )),
        body:(product != null)? Column(
          children: [
            SizedBox(height: 10,),
            if(product.length!=0)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                childAspectRatio: 300 / 500,
                // padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  for (int i = 0; i < product.length; i++)
//                        for (int j = 0; j <product[i]['images'].length; j++)
                    GestureDetector(
                      child: Container(color:Colors.white ,padding: EdgeInsets.only(bottom: 5),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: Opacity(
                                  opacity: 1,
                                  child: CachedNetworkImage(
                                    imageUrl:product[i]['images'][0]['src'],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,
                              child: Text(product[i]['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text("\$"+product[i]['price'],
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                            Container(color: Color(0xFFdd0e34),height: 30,width: 120,
                              child: Center(child: Text("Select Options",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ShopProductdetails(product[i])));
                      },
                    ),
                ],
              ),
            ),
            if(post.length!=0)
            Expanded(
          child:  ListView.builder(itemCount: post.length,itemBuilder: (context,index){
              return ListTile(
                title: Text(post[index]['post_title']),
              );
            }))
          ],
        ):Center(child: Text("")),
    ),);
  }
}

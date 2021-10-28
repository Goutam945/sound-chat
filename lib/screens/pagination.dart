import 'package:http/http.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

class Interviewpagination extends StatefulWidget {
  const Interviewpagination({Key key}) : super(key: key);

  @override
  _InterviewpaginationState createState() => _InterviewpaginationState();
}

class _InterviewpaginationState extends State<Interviewpagination> {
  int currentPage = 1;
  List users = [];
  int total_pages;
  List data = [];
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();
  @override
  initState() {
    super.initState();
    getUserList();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (!isLoading) {
          isLoading = !isLoading;
          currentPage++;
          getUserList().whenComplete(() {
            setState(() {
              // isLoading = !isLoading;
            });
          });
        }
      }
      // if (_scrollController.position.minScrollExtent ==
      //     _scrollController.position.pixels) {
      //   if (!isLoading) {
      //     isLoading = !isLoading;
      //     currentPage--;
      //     getUserList().whenComplete(() {
      //       setState(() {});
      //     });
      //   }
      // }
    });
  }

  Future getUserList() async {
    final Uri url = Uri.parse("https://reqres.in/api/users?page=$currentPage");
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic res = json.decode(response.body);
      setState(() {
        users = res['data'];
        //  users.add(res['data']);
        for (int i = 0; i < users.length; i++) data.add(users[i]);
        total_pages = res["total_pages"];
        isLoading = false;
      });
      return res;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          // data.add(users[i]);
                          return Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      width: 110,
                                      height: 150,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: GestureDetector(
                                            child: CachedNetworkImage(
                                              imageUrl: data[i]['avatar'],
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            onTap: () {
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             InterviewNewPlayer(
                                              //               snapshot.data.data[
                                              //                           'data']
                                              //                       ['free_content']
                                              //                   [i]['video_url'],
                                              //               snapshot.data.data[
                                              //                           'data']
                                              //                       ['free_content']
                                              //                   [i]['post_title'],
                                              //               snapshot.data.data[
                                              //                           'data']
                                              //                       ['free_content']
                                              //                   [i]['post_excerpt'],
                                              //               i,
                                              //             )));
                                            },
                                          ))),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          );
                        }),
                  ),
                  if (isLoading) CircularProgressIndicator()
                ],
              ),
            ),
          ],
        ));
  }
}

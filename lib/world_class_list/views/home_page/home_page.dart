import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/world_class_list/model/time_model.dart';
import 'package:untitled2/world_class_list/view_model/view_model.dart';
import 'package:untitled2/world_class_list/views/home_page/country_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorldTimeViewModel worldTimeViewModel = context.watch<WorldTimeViewModel>();
    String day = "https://images.unsplash.com/photo-1558556563-7315877d09f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRheXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
    String night = "https://i.ytimg.com/vi/MaJ-jFm3kV4/maxresdefault.jpg";
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image.network(
          //   "https://images.unsplash.com/photo-1558556563-7315877d09f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRheXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
          //   fit: BoxFit.fitHeight,
          // ),
           CachedNetworkImage(
             imageUrl: worldTimeViewModel.isDayTime? day : night,
             placeholder: (context, url) => CircularProgressIndicator(),
             errorWidget: (context, url, error) => Icon(Icons.error),
             fit: BoxFit.cover,
            ),

          _ui(worldTimeViewModel, context)
        ],
      ),
    );
  }
}

Widget _ui(WorldTimeViewModel worldTimeViewModel, BuildContext context) {
  if(worldTimeViewModel.isLoading) {
    return Container();
  }
  if(worldTimeViewModel.classError != null) {
    return Container();
  }
  var items = worldTimeViewModel.timeModel;
  var time = items.dateTime;
  var datetime = DateTime.parse(time.toString());
  var offset = items.offset!.substring(1,3);
  datetime = datetime.add(Duration(hours: int.parse(offset)));
  var finalDate = DateFormat.Hm().format(datetime);


    return Positioned(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountryList()));
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Icon(Icons.add_location, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text(
                    "Change location",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
          Text(
            worldTimeViewModel.selected? worldTimeViewModel.detailModel.country! : "Nigeria",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 50,
                color: Colors.white
            ),
          ),
          Text(
            worldTimeViewModel.selected? worldTimeViewModel.detailModel.datetime!:finalDate,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 60,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
}


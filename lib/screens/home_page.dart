import 'package:flutter/material.dart';
import 'package:purple/functions/functions.dart';
import 'package:purple/screens/detail_screen.dart';
import 'package:purple/screens/full_screen.dart';
import 'package:purple/utils/dynamic_sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List colorList = [
      const Color(0xFF696969),
      const Color(0xFF30D5C8),
      const Color(0xFfC8A2C8),
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.grey,
      Colors.black,
      Colors.brown
    ];
    List categoriesList = [
      {
        "value": "Backgrounds",
        "img":
            "https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2FsbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&w=1000&q=80"
      },
      {
        "value": "Fashion",
        "img":
            "http://www.chowrangi.pk/wp-content/uploads/2016/04/fashion-in-pakistan.jpg"
      },
      {
        "value": "Nature",
        "img":
            "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/325466_1100-1100x628.jpg"
      },
      {
        "value": "Science",
        "img":
            "https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?size=626&ext=jpg"
      },
      {
        "value": "People",
        "img":
            "https://www.incimages.com/uploaded_files/image/1920x1080/getty_517194189_373099.jpg"
      },
      {
        "value": "Health",
        "img":
            "https://www.expatica.com/app/uploads/sites/12/2014/05/Health-Insurance.jpg"
      },
      {
        "value": "Feelings",
        "img":
            "https://media.self.com/photos/57d8a655d3276fe232946e16/2:1/w_1280,c_limit/meditation-poolside-calm-870.jpg"
      },
      {
        "value": "Education",
        "img":
            "https://www.thenews.com.pk/assets/uploads/akhbar/2022-01-12/924492_2140068_Education_akhbar.jpg"
      },
      {
        "value": "Food",
        "img":
            "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528"
      },
      {
        "value": "Music",
        "img":
            "https://www.cnet.com/a/img/8wJI1VrEKNFiPmkz5Yx1O5iJNwQ=/940x0/2021/06/16/5c628be6-6941-4ee0-b5df-d8ca364cdc34/apple-music-iphone-with-headphones-001.jpg"
      },
      {
        "value": "Computer",
        "img":
            "https://i.pcmag.com/imagery/articles/00tLYTqwmgFvacZlYPc5ecO-8..v1583853669.jpg"
      },
      {
        "value": "Industry",
        "img":
            "https://www.processindustryinformer.com/wp-content/uploads/slider/cache/9e4aac39c7bd1dbedb79417fc5438b2f/process-industry.jpg"
      },
      {
        "value": "Animals",
        "img":
            "https://singularityhub.com/wp-content/uploads/2018/10/shutterstock_672433252-1068x601.jpg"
      },
      {
        "value": "Places",
        "img":
            "https://globalgrasshopper.com/wp-content/uploads/2020/03/most-beautiful-places-to-visit-in-Japan-1000x667.jpg"
      },
      {
        "value": "Religion",
        "img":
            "https://www.clickview.com.au/wp-content/uploads/AU-blog-content-talking-religion-with-students-1024x538.png"
      },
      {
        "value": "Buildings",
        "img":
            "https://media.istockphoto.com/photos/low-angle-of-tall-building-in-manhattan-picture-id1291177121?b=1&k=20&m=1291177121&s=170667a&w=0&h=aI1PkWS_GkXJ4Qz0gz2cTOud95SS4hUa4iZc1kqWYL4="
      },
      {
        "value": "Travel",
        "img":
            "https://media-exp1.licdn.com/dms/image/C4D1BAQGGdNo6IlDOCQ/company-background_10000/0/1519801807380?e=2159024400&v=beta&t=VWHuXHsmYAXZB4XQn7H63FLLvHjjMfs6CdxCh3HwcCM"
      },
      {
        "value": "Transportation",
        "img":
            "https://www.azonano.com/images/Article_Images/ImageForArticle_595(1).jpg"
      },
      {
        "value": "Sports",
        "img":
            "https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190756?k=20&m=949190756&s=170667a&w=0&h=RBVLWqBNY1OrRyUX-bi-gcEPtszzZOxzmU-ori5467M="
      },
      {
        "value": "Business",
        "img":
            "http://online.hbs.edu/Style%20Library/api/resize.aspx?imgpath=/PublishingImages/Desk%20of%20Business%20Woman.png&w=1200&h=630"
      },
    ];
    Boxes getBox = Boxes();
    var spacing = 0.04;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xff4a0066),
            Color(0xff8c54a1),
          ])),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            flexibleSpace: SafeArea(
              child: Center(
                child: searchBar(context),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getBox.heigthBox(context, spacing),
                sideText(context, "Best of the month"),
                getBox.heigthBox(context, spacing),
                FutureBuilder(
                    future: getLatestWallpapers(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return customList(context, 0.55, 0.4,
                            snapshot: snapshot.data);
                      } else {
                        return const Text("Loading");
                      }
                    }),
                getBox.heigthBox(context, spacing),
                sideText(context, "The color tone"),
                getBox.heigthBox(context, spacing),
                customList(context, 0.15, 0.15, providedValue: colorList),
                getBox.heigthBox(context, spacing),
                sideText(context, "Categories"),
                getBox.heigthBox(context, spacing),
                customGrid(context, categoriesList),
                getBox.heigthBox(context, spacing),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sideText(context, text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Sizes().width(context, 0.04)),
      ),
    );
  }

  customList(context, heigth, width, {providedValue = "", snapshot = ""}) {
    return Container(
      margin: EdgeInsets.only(left: Sizes().width(context, 0.05)),
      height: Sizes().heigth(context, heigth),
      width: Sizes().width(context, 1),
      child: ListView.builder(
        itemCount: providedValue != ""
            ? providedValue.length
            : snapshot != ""
                ? snapshot.length
                : 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (snapshot != "") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullScreen(
                              img: snapshot[index]["largeImageURL"],
                              id: snapshot[index]["id"].toString(),
                            )));
              }
            },
            child: Hero(
              tag: snapshot != "" ? snapshot[index]["id"].toString() : index,
              child: Container(
                margin: EdgeInsets.only(right: Sizes().width(context, 0.03)),
                decoration: BoxDecoration(
                    image: snapshot != ""
                        ? DecorationImage(
                            image:
                                NetworkImage(snapshot[index]["largeImageURL"]),
                            fit: BoxFit.cover)
                        : null,
                    color: providedValue != ""
                        ? providedValue[index]
                        : Colors.white,
                    borderRadius:
                        BorderRadius.circular(Sizes().width(context, 0.04))),
                height: Sizes().heigth(context, heigth),
                width: Sizes().width(context, width),
              ),
            ),
          );
        },
      ),
    );
  }

  customGrid(context, categoryList) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Sizes().width(context, 0.03),
          crossAxisSpacing: Sizes().width(context, 0.03),
          childAspectRatio:
              Sizes().width(context, 0.5) / Sizes().width(context, 0.3)),
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(category: categoryList[index]["value"])));
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken),
                    image: NetworkImage(categoryList[index]["img"]),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(Sizes().width(context, 0.04))),
            child: Text(
              categoryList[index]["value"],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  searchBar(context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(Sizes().width(context, 0.02))),
      margin: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      padding: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Find Wallpapers",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          const Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

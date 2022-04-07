import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class FullScreen extends StatefulWidget {
  final String img, id, user, userImage, tags;
  const FullScreen(
      {Key? key,
      required this.img,
      required this.id,
      required this.user,
      required this.userImage,
      required this.tags})
      : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  final RoundedLoadingButtonController _controller =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _controller1 =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _controller2 =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onVerticalDragStart: (d) {
            showModalBottomSheet<void>(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffffffff),
                            Color(0xff8c54a1),
                          ],
                        ),
                      ),
                      child: imageInformation());
                });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img), fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                bottom: 50,
                child: Column(
                  children: [
                    setWallpaperButtons(_controller, "Set Wallpaper",
                        Colors.purple.withOpacity(0.7)),
                    const SizedBox(
                      height: 10,
                    ),
                    setWallpaperButtons(_controller1, "Set Lockscreen",
                        Colors.purple.withOpacity(0.7)),
                    const SizedBox(
                      height: 10,
                    ),
                    setWallpaperButtons(_controller2, "Set Both",
                        Colors.purple.withOpacity(0.7)),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(200)),
                        ),
                        width: 80,
                        height: 100,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ))),
              ),
              Positioned(
                  bottom: 10,
                  right: 20,
                  child: Image.asset(
                    "assets/logo.png",
                    width: 100,
                  )),
              const Positioned(
                bottom: 10,
                child: Icon(Icons.keyboard_arrow_up_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setWallpaperButtons(
      RoundedLoadingButtonController controller, String text, Color color) {
    return RoundedLoadingButton(
        color: color,
        controller: controller,
        onPressed: () {},
        child: Text(text));
  }

  Widget imageInformation() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(widget.userImage),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.user,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Text("Tags : " + widget.tags)),
          const Text("All these wallpapers are provided by pixabay"),
          Image.asset(
            "assets/logo.png",
            width: 100,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';
class RAWMAG extends StatefulWidget {
  const RAWMAG({super.key});
  @override
  State<RAWMAG> createState() => _RAWMAGState();
}

class _RAWMAGState extends State<RAWMAG> {
  double h = 17;
  Offset dragGesturePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              setState(() {
                h++;
              });
            },
            icon: Icon(Icons.add)),
        IconButton(
            onPressed: () {
              setState(() {
                h--;
              });
            },
            icon: Icon(Icons.minimize))
      ]),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: RepaintBoundary(
          child: Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('State of Palestine',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                RepaintBoundary(
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onPanUpdate: (DragUpdateDetails details) =>
                            setState(
                              () {
                             dragGesturePosition = details.localPosition;
                          },
                        ),
                        child: Text('After World War II, in 1947, the United Nations (UN) adopted a Partition Plan for Mandatory Palestine, which recommended the creation of independent Arab and Jewish states and an internationalized Jerusalem.[30] Immediately after the United Nations General Assembly adopted the plan as Resolution 181, a civil war broke out in Palestine,[31] and the plan was not implemented.[32] The day after the establishment of the State of Israel on 14 May 1948,[33][34][35] neighboring Arab countries invaded the former British Mandate and engaged Israeli forces in the 1948 Arab–Israeli War.[36][37] Later, the All-Palestine Government was established by the Arab League on 22 September 1948 to govern the All-Palestine Protectorate in the Egyptian-occupied Gaza Strip. It was soon recognized by all Arab League members except Transjordan, which had occupied and later annexed the West Bank, including East Jerusalem. Palestine is currently recognized by 138 of the 193 United Nations (UN) member states. Though jurisdiction of the All-Palestine Government was declared to cover the whole of the former Mandatory Palestine, its effective jurisdiction was limited to the Gaza Strip.[38] During the Six-Day War in June 1967, Israel captured the Gaza Strip and the Sinai Peninsula from Egypt, the West Bank and East Jerusalem from Jordan, and the Golan Heights from Syria',
                          style: TextStyle(fontSize: h),),
                      ),
                      Positioned(
                        left: dragGesturePosition.dx,
                        top: dragGesturePosition.dy,
                        child: const RawMagnifier(
                          decoration: MagnifierDecoration(
                            shape:
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.pink, width: 3),
                            ),
                          ),
                          size: Size(160, 60),
                          magnificationScale: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:admin_panel/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../models/my_files.dart';

class RealDataInfo extends StatefulWidget {
  const RealDataInfo({
    Key? key,
    required this.info,
    required this.index,
  }) : super(key: key);

  final CloudStorageInfo info;
  final int index;
  @override
  State<RealDataInfo> createState() => _RealDataInfoState();
}

class _RealDataInfoState extends State<RealDataInfo> {
  Map<String, int> counts = {};
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    counts = await getCounts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(defaultPadding * 0.50),
                  decoration: BoxDecoration(
                    color: widget.info.color != null
                        ? widget.info.color!.withOpacity(0.1)
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset(widget.info.svgSrc!,
                      color: widget.info.color),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  widget.info.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.index == 0
                          ? counts['activeUsers'].toString()
                          : widget.index == 1
                              ? counts["activeOrders"].toString()
                              : widget.index == 2
                                  ? counts["activeRequests"].toString()
                                  : counts["completedOrders"].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 80),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}

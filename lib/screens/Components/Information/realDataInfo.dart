import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:admin_panel/responsive.dart';
import '../../../constants.dart';
import '../../models/my_files.dart';

class RealDataInfo extends StatelessWidget {
  const RealDataInfo({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    var title = info.title;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(defaultPadding * 0.50),
                decoration: BoxDecoration(
                  color:
                      info.color != null ? info.color!.withOpacity(0.1) : null,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(info.svgSrc!, color: info.color),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${info.numOfFiles} ',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}

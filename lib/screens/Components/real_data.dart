import 'package:admin_panel/constants.dart';
import 'package:flutter/material.dart';

import '../models/my_files.dart';
import 'Information/realDataInfo.dart';

class RealData extends StatelessWidget {
  const RealData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Users Data',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: demoMyFiles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: defaultPadding),
                  itemBuilder: (context, index) => RealDataInfo(
                    info: demoMyFiles[index],
                    index: index,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

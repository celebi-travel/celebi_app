import '../../../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello Azad',
                  style: context.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.w400)),
              Text(
                'Create Your Next\nRoute',
                style:
                    context.textTheme.headline5!.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://pbs.twimg.com/profile_images/1347941491889549318/uvn8isXg_400x400.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

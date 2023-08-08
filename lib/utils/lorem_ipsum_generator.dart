import 'dart:math';

import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

String generateLoremIpsum(
  int length,
  BuildContext context, // temp
) {
  const loremIpsum = '''
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet nibh gravida nulla tempus lobortis eget vel sapien. Phasellus ligula elit, efficitur vel ex at, rhoncus cursus orci. Donec congue dui at placerat scelerisque. Sed et pretium dolor. Quisque congue tortor vel augue dapibus, et scelerisque mi mollis. Sed at turpis finibus quam malesuada sagittis. Fusce ut sollicitudin lectus. Vestibulum vel nisi ac nisi ultricies dapibus at ut sapien. Donec porttitor felis at nibh cursus, quis laoreet purus fermentum. Pellentesque quis orci quam. Aenean dignissim vestibulum dolor. In hac habitasse platea dictumst. Nulla feugiat fringilla arcu ut ullamcorper. Praesent vel volutpat lacus, non semper nulla. Morbi molestie enim quis odio faucibus pharetra. Nunc nunc purus, porttitor quis felis ut, auctor aliquam velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin sed urna non velit volutpat viverra nec vitae tellus. Fusce et nibh posuere, fermentum orci sed, gravida metus. Phasellus bibendum, tellus sed euismod rhoncus, erat purus gravida felis, quis malesuada lorem justo suscipit est. Ut imperdiet imperdiet neque sit amet eleifend. Fusce faucibus sapien nisl, a sodales diam mollis non. Mauris a elit pulvinar dolor pulvinar placerat ac varius lorem. Nam aliquam ac justo eu cursus. Ut congue lectus ac tempus feugiat. Praesent pretium elementum lorem, congue varius lacus sagittis eu. Nunc posuere tincidunt cursus. Suspendisse eget nibh ut felis ultricies interdum sit amet et neque. Morbi ornare ligula lorem, eu auctor metus mollis at. Donec semper ex nec nibh congue, porta iaculis lorem cursus. Fusce a quam eu dui volutpat venenatis. Nunc suscipit orci in ipsum cursus, a feugiat mi eleifend. Maecenas ut risus egestas, tempor magna id, tincidunt ante. Proin dignissim hendrerit ultrices. Maecenas cursus purus id viverra congue. Suspendisse laoreet ut lorem et vestibulum. Etiam porta rhoncus nibh, ac convallis est pharetra eget. Sed justo purus, sollicitudin sed enim non, accumsan egestas ligula. Cras viverra imperdiet venenatis. Pellentesque at mollis ante. In odio risus, condimentum eu sapien vel, vestibulum cursus lorem. Pellentesque a interdum tellus, et porta urna. Maecenas ac dui at felis auctor scelerisque. Aenean eget metus vitae ipsum varius tincidunt vel quis elit. Phasellus a faucibus justo, quis pharetra elit. Ut vitae ultrices elit. Quisque pharetra mollis ligula, id ornare nisl viverra ut. Sed quis justo sed dolor faucibus blandit id ut tortor. Sed pharetra dolor quis arcu facilisis, vitae ultricies felis blandit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer ut enim sit amet mi blandit porttitor. Mauris varius quam ut ex euismod ornare. Cras fermentum ante efficitur eros vestibulum, et vehicula ligula consectetur. Morbi vel venenatis tortor. In ultricies dui quis ultrices blandit. Nunc eu aliquet enim. Nullam finibus arcu a massa placerat imperdiet. Integer fringilla leo vel tristique venenatis. Sed efficitur felis et justo tincidunt, in pharetra risus luctus. Morbi pretium vel nibh ac convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent consectetur erat vel egestas pharetra. Quisque eu lorem gravida, tristique eros eget, dictum justo. Sed mi ipsum, placerat vel gravida sed, tempus ac arcu. Vivamus iaculis, odio nec volutpat euismod, velit eros posuere leo, vel faucibus nulla magna in felis. Integer arcu sapien, sodales sed mauris a, varius placerat purus. Maecenas sit amet purus sed nulla iaculis feugiat. Integer euismod, urna at ullamcorper consectetur, dolor massa interdum mauris, laoreet volutpat leo dolor vitae elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis sed aliquet nunc, vitae imperdiet ipsum. Nulla eget porta nisi, ac mollis magna. Quisque id eros laoreet, mattis sem in, tempor nulla.
  ''';

  final words = loremIpsum.split(' ');
  final random = Random();

  List<String> generatedWords = [];
  while (generatedWords.length < length) {
    final randomIndex = random.nextInt(words.length);
    generatedWords.add(words[randomIndex]);
  }

  print(getScreenWidth(context)); // temp

  return generatedWords.join(' ');
}

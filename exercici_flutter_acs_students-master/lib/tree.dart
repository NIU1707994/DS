import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class Area {
  late String id;
  late List<dynamic> children;
  late bool favourite = false;
  Widget icon = const Icon(
    Icons.layers,
    size: 40,
    color: Colors.black,
  );
  Area(this.id, this.children);
  Area.icon(this.id, this.children, this.icon);
}

class Partition extends Area {
  Partition(String id, List<Area> children) : super(id, children);
}

class Space extends Area {
  Space(String id, List<Door> children)
      : super.icon(
            id,
            children,
            SvgPicture.asset(
              './icons/icons8-habitación-64.svg',
              width: 40,
              height: 40,
            ));
}

class Door {
  late String id;
  late bool closed;
  late String state;

  Door({required this.id, this.state = "unlocked", this.closed = true});
}

// at the moment this class seems unnecessary but later we will extend it
class Tree {
  late Area root;

  Tree(Map<String, dynamic> dec) {
    // 1 level tree, root and children only, root is either Partition or Space.
    // If Partition children are Partition or Space, that is, Area. If root
    // is a Space, children are Door.
    // There is a JSON field 'class' that tells the type of Area.
    if (dec['class'] == "partition") {
      List<Area> children = <Area>[]; // is growable
      for (Map<String, dynamic> area in dec['areas']) {
        if (area['class'] == "partition") {
          children.add(Partition(area['id'], <Area>[]));
        } else if (area['class'] == "space") {
          children.add(Space(area['id'], <Door>[]));
        } else {
          assert(false);
        }
      }
      root = Partition(dec['id'], children);
    } else if (dec['class'] == "space") {
      List<Door> children = <Door>[];
      for (Map<String, dynamic> d in dec['access_doors']) {
        children.add(Door(id: d['id'], state: d['state'], closed: d['closed']));
      }
      root = Space(dec['id'], children);
    } else {
      assert(false);
    }
  }
}

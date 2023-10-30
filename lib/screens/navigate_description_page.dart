// import 'package:flip_widget/flip_widget.dart';
// import 'package:flutter/material.dart';

// class NavigateDescriptionPage extends StatefulWidget {
//   const NavigateDescriptionPage({super.key});

//   @override
//   State<NavigateDescriptionPage> createState() =>
//       _NavigateDescriptionPageState();
// }

// class _NavigateDescriptionPageState extends State<NavigateDescriptionPage> {
//   final GlobalKey<FlipWidgetState> flipKey = GlobalKey<FlipWidgetState>();
//   @override
//   void initState() {
//     super.initState();
//     flipKey.currentState?.startFlip();
//     flipKey.currentState?.flip(0.5, 0.0);
//     flipKey.currentState?.stopFlip();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "Description page",
//           style: TextStyle(color: Colors.amberAccent),
//         ),
//       ),
//       body: FlipWidget(
//         key: flipKey,
//         child: Container(
//           color: Colors.blue,
//           child: Center(child: Text('hello')),
//         ),
//       ),
//     );
//   }
// }

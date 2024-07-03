import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final _balckColor = const Color(0xFF1f2123);

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      decoration: BoxDecoration(
          color: isInverted ? Colors.white : _balckColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      color: isInverted ? _balckColor : Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(amount,
                      style: TextStyle(
                          color: isInverted ? _balckColor : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(width: 12),
                  Text(code,
                      style: TextStyle(
                          color: isInverted
                              ? _balckColor.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          fontSize: 20)),
                ],
              ),
            ],
          ),
          Transform.scale(
            scale: 1.5,
            child: Transform.translate(
              offset: const Offset(0, 30),
              child: Icon(
                icon,
                size: 120,
                color: isInverted ? _balckColor : Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

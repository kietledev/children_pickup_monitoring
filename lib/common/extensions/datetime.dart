extension TicksOnDateTime on DateTime {
  static const _epochTicks = 621356220000000000;
  int get ticks => microsecondsSinceEpoch * 10 + _epochTicks;
}

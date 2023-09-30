enum MinoDirection {
  N,
  W,
  S,
  E;

  const MinoDirection();

  MinoDirection rotate() {
    return switch (this) {
      MinoDirection.N => MinoDirection.E,
      MinoDirection.E => MinoDirection.S,
      MinoDirection.S => MinoDirection.W,
      MinoDirection.W => MinoDirection.N,
    };
  }
}

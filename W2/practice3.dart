class MyDuration {
  final int _milliseconds;

  MyDuration._internal(this._milliseconds) {
    if (_milliseconds < 0) {
      throw Exception("Duration can't be negative!");
    }
  }

  
  MyDuration.fromHours(int hours) : _milliseconds = hours * 3600000 {
    assert(hours >= 0, "Hours can't be negative");
  }
  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60000 {
    assert(minutes >= 0, "Minutes can't be negative");
  }
  MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000 {
    assert(seconds >= 0, "Seconds can't be negative");
  }

  int get inMilliseconds => _milliseconds;
  int get inSeconds => _milliseconds ~/ 1000;
  int get inMinutes => _milliseconds ~/ 60000;
  int get inHours => _milliseconds ~/ 3600000;

  bool operator >(MyDuration other) => _milliseconds > other._milliseconds;
  bool operator <(MyDuration other) => _milliseconds < other._milliseconds;
  MyDuration operator +(MyDuration other) =>
      MyDuration._internal(_milliseconds + other._milliseconds);
  MyDuration operator -(MyDuration other) =>
      MyDuration._internal(_milliseconds - other._milliseconds);

  @override
  String toString() {

    int totalSeconds = _milliseconds ~/ 1000;
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(6);
  MyDuration duration2 = MyDuration.fromMinutes(65);

  print(duration1 + duration2);
  print(duration1 > duration2); 

  try {
    print(duration2 - duration1); 
  } catch (e) {
    print(e);
  }
}

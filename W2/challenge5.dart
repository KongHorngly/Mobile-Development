class Passenger {
  final String firstName;
  final String lastName;

  const Passenger({required this.firstName, required this.lastName});

  String toString() => '$firstName $lastName';
}

enum TravelClass { economy, business, first }

class TravelTicket {
  final Passenger passenger;
  final String destination;
  final TravelClass travelClass;
  final String? discountCode;
  const TravelTicket({
    required this.passenger,
    required this.destination,
    required this.travelClass,
    this.discountCode,
  });

  String toString() =>
      'Ticket: \n Name: ${passenger} \n Destination: $destination \n Class: ${travelClass.name}'
      '${discountCode != null ? " \n code: $discountCode" : ""}';
}

void main() {
  final ticket = TravelTicket(
    passenger: Passenger(firstName: 'Kong', lastName: 'Horngly'),
    destination: 'Tokyo',
    travelClass: TravelClass.business,
    discountCode: 'Newfly',
  );
  print(ticket);
}

class CovidApi{
  static final String host = 'api.rootnet.in/covid19-in';

  static Uri covidEndpointUri() => Uri(
    scheme: 'https',
    host: host,
  );
}

//List of all Status we're using to display informaion about
enum Status {
  total,
  active,
  recovered,
  deaths,
}

@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Z01_R_CONNECTION_V02'
define root view entity Z01_C_CONNECTION_V02
  provider contract transactional_query
  as projection on Z01_R_CONNECTION_V02
{
  key UUID,
  CarrierID,
  ConnectionID,
  AirportFromID,
  CityFrom,
  CountryFrom,
  AirportToID,
  CityTo,
  CountryTo,
  LocalLastChangedAt
  
}

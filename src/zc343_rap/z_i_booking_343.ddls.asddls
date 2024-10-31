@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_BOOKING_343
  as projection on Z_r_BOOKING_343
{
  key BookingUUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      /* Associations */
      _BookingStatus,
      _BookingSupplement: redirected to composition child Z_I_BKSUPPL_343,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent Z_I_TRAVEL_343
}

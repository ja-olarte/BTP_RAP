@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true

define view entity Z_C_BKSUPPL_343
  as projection on Z_r_BKSUPPL_343
{
  key BookingSupplUUID,
      TravelUUID,
      BookingUUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookSupplPrice,
      CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      /* Associations */
      _Booking : redirected to parent Z_C_BOOKING_343,
      _Product,
      _SupplementText,
      _Travel : redirected to Z_C_TRAVEL_343
}

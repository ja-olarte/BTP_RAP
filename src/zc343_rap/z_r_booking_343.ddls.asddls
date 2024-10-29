@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_r_BOOKING_343
  as select from zbooking_343

  association to parent Z_r_TRAVEL_343  as _Travel on $projection.TravelUUID = _Travel.TravelUUID
  composition [0..*] of Z_r_BKSUPPL_343 as _BookingSupplement
{
  key booking_uuid          as BookingUUUID,
      parent_uuid           as TravelUUID,

      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as AirlineID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,

      //local ETag field - OData
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Travel,
      _BookingSupplement
}

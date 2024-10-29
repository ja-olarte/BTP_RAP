@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_r_BKSUPPL_343
  as select from zbksuppl_343
  
  association to parent Z_r_BOOKING_343 as _Booking on $projection.BookingUUUID = _Booking.BookingUUUID
{
  key bookingsuppl_uuid     as BookingSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUUID,

      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,

      //local ETag - OData
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      _Booking
}
